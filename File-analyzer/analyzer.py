import sys
import re
from pathlib import Path
from collections import Counter

def main():
    if len(sys.argv) < 2:  # command line parameters
        print("Usage: python analyzer.py <path-to-text file>")
        sys.exit(1) 
        # If the number of parameters is less than 2 (i.e. the input file name is not specified) -> error

    path = Path(sys.argv[1])
    if not path.exists():
        print(f"[ERROR] File not found: {path}")
        sys.exit(1)
    
    try:
        if len(sys.argv) > 2:
            top_n = int(sys.argv[2])
        else:
            top_n = 10
            # That number specifies how many of the most frequent words we return.
    except:
        print(f"[ERROR] top-n must be a number.")
        sys.exit(1)

    # read the file/ Unicode friendly
    text = path.read_text(encoding="utf-8", errors="ignore")
    line_count = len(text.splitlines())

    words = re.findall(r"\w+", text,flags=re.UNICODE)
    # r"\w+" is (regex) used to identify word characters.
    # flags=re.UNICODE -> allows the regex engine to treat the text as Unicode.
    word_count = len(words)
    char_count = len(text)
    words = text.split()

    normalized = [w.casefold() for w in words]
    unique_count = len(set(normalized))

    print("== Basic Text Stats ==")
    print(f"File:          {path.name}")
    print(f"Lines:         {line_count}")
    print(f"Words:         {word_count}")
    print(f"Characters:    {char_count}")
    print(f"Unique words:  {unique_count}")

    counter = Counter(normalized)
    print(f'\n=== Top {top_n} Most frequebt words ===')
    for word, freq in counter.most_common(top_n):
        print(f"{word:<15} {freq}")


if __name__ == "__main__":
    main()