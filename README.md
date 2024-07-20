# git-test

Test repo for testing git commands.

## Test of Per-Environment Branching

This script tests a branch per environment scenario

The final log output should look something like this:

```
* 0a32c90 (HEAD -> features/1dev, origin/features/1dev) changed again 2.txt
* 5569a08 (origin/dev, dev) changed 1dev.txt
* 4db3c36 added 1dev.txt
| * 0c117cb (origin/features/2, features/2) added 2.txt
| * 56e537d (origin/main, origin/features/1main, main, features/1main) added 1main.txt
|/  
| * 72b2d8e (origin/pfx, origin/features/1pfx, pfx, features/1pfx) added 1pfx.txt
|/  
* 78df3de test
* 295a287 added 1main.txt
* 0861241 fix
* 219865e bug
```

Note dev, pfx, main branches have all deviated.