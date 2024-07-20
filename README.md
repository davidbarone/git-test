# git-test

Test repo for testing git commands.

## Test of Per-Environment Branching

This script tests a branch per environment scenario

The final log output should look something like this:

```
* 675d573 (HEAD -> dev, origin/features/1dev, origin/dev, features/1dev) changed again 2.txt
* 68453ac changed 1dev.txt
* 4f003c8 added 1dev.txt
| * a27b2ca (origin/features/2, features/2) added 2.txt
| * d18be49 (origin/main, origin/features/1main, main, features/1main) added 1main.txt
|/  
| * 01c7779 (origin/pfx, origin/features/1pfx, pfx, features/1pfx) added 1pfx.txt
|/  
* 0955214 test
* 51f2bce test
* ed9710d added 1main.txt
* fdf60a7 tidy up
```

Note dev, pfx, main branches have all deviated.