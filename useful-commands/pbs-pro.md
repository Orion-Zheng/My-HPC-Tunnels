```
pbsnodes -aSj | awk '($9 != "0/0" ) {print}' | grep free
```