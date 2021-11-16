from os.path import join
from sys import argv


def msg(file, line, message):
    print(f'{file}:{line}')
    print(f'{message}')
    print()


def warning(file, line, message):
    msg(file, line, f'WARNING: {message}')


def error(file, line, message):
    msg(file, line, f'ERROR: {message}')
    exit(1)


def check_indent(indent, line, err=True):
    return line.startswith(' ' * indent)


def parsevar(module, no, line, export):
    if ':' in line:
        variable, comment = line.split(':')
        variable, comment = variable.strip(), comment.lstrip()

        if not export:
            warning(module, no, f"Comment in import of variable '{variable.strip()}'")

    else:
        variable = line

        if export:
            warning(module, no, f"Variable '{variable}' is missing comment.")

    return variable


def analyze(module, variables):
    mode = ''
    indent = 0

    optionals = False

    either = set()
    check_either = False

    with open(module) as f:
        for no, line in enumerate(f, start=1):
            line = line.strip()

            if mode in {'imports', 'imports.either', 'import.optionals', 'exports'}:
                blockline = line.lstrip('#')


            if line == '# IMPORTS:':
                mode = 'imports'
                indent = 3
                optionals = False

            elif line.startswith('# EXPORTS:'):
                mode = 'exports'
                indent = 3
                optionals = False

            elif (mode.startswith('imports') or mode == 'exports') and not line:
                mode = ''
                indent = 0
                optionals = False

            elif mode == 'imports':
                if not blockline: continue

                if line == '# Optionals:':
                    optionals = True
                    continue

                if check_indent(indent, blockline):
                    blockline = blockline.lstrip()

                else:
                    error(module, no, 'Unexpected indentation in imports block.')

                if blockline == 'Either:':
                    mode += '.either'
                    indent += 2
                    continue

                variable = parsevar(module, no, blockline, False)

                action = warning if optionals else error

                if variable not in variables:
                    action(module, no, f"Import of {'optional' if optionals else ''} variable '{variable}' not satisfied.")

            elif mode == 'imports.either':
                if check_indent(indent, blockline):
                    blockline = blockline.lstrip()
                    variable =parsevar(module, no, blockline, False)
                    either.add(variable)

                else:
                    indent -= 2
                    check_either = True

            elif mode == 'exports':
                if not blockline: continue

                if check_indent(indent, blockline):
                    blockline = blockline.lstrip()

                else:
                    error(module, no, 'Unexpected indentation in exports block.')

                override = False
                if blockline.startswith('override '):
                    override = True
                    blockline = blockline[len('override '):]

                variable = parsevar(module, no, blockline, True)

                if variable in variables and not override:
                    warning(module, no, f"Variable '{variable}'' declared without 'override' modifier")

                variables.add(variable)

            if check_either:
                check_either = False

                if not any(map(variables.__contains__, either)):
                    error(module, no, 'Import of either variable {} not satisfied.'.format(' / '.join(f"'{v}'" for v in either)))

                either = []


def main():
    wd = '.'
    variables = set()

    analyze(argv[1], variables)

    with open(argv[1]) as f:
        for line in f:
            if line.startswith('source'):
                module = join(wd, line[len('source '):].replace('/', '\\').strip())

                analyze(module, variables)

            elif line.startswith('cd'):
                wd = join(wd, line[len('cd '):].strip().replace('/', '\\'))


if __name__ == '__main__':
    main()
