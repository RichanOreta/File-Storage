import pyperclip, time, sys

file_paths = sys.argv[1:]

for p in file_paths:
    with open(p, 'r') as f:
        string = ''
        for i, x in enumerate(f.readlines()):
            if x != '\n':
                string = string + x
            else:
                pyperclip.copy(string)
                string = ''
                time.sleep(1)
        pyperclip.copy(string)
