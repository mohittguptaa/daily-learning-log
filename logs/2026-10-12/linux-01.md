# Linux: count lines in many files

`wc -l $(git ls-files "*.py") | tail -1` totals lines in tracked Python files.
