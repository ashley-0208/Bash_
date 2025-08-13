import sys
import re
from pathlib import Path

def main():
    if len(sys.argv) < 2:  # command line parameters
        print("Usage: python analyzer.py <oath-to-text file>")
        sys.exit(1) 
        # If the number of parameters is less than 2 (i.e. the input file name is not specified) -> error

    path = Path(sys.argv[1])
    if not path.exists():
        print(f"[ERROR] File not found: {path}")
        sys.exit(1)

    # read the file/ Unicode friendly
    text = path.read_text(encoding="utf-8", errors="ignore")
    line_count = len(text.splitlines())

    words = re.findall(r"\w+", text,flags=re.UNICODE)
    # r"\w+" is (regex) used to identify word characters.
    # flags=re.UNICODE -> allows the regex engine to treat the text as Unicode.
    word_count = len(words)
    char_count = len(text)

    for w in words:
        normalized = w.casefold() # similar to .lower()
    unique_count = len(set(normalized))

    print("== Basic Text Stats ==")
    print(f"File:          {path.name}")
    print(f"Lines:         {line_count}")
    print(f"Words:         {word_count}")
    print(f"Characters:    {char_count}")
    print(f"Unique words:  {unique_count}")

if __name__ == "__main__":
    main()