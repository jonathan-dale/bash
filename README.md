
This is a repo with various bash scripts and other usefull functions for server side development and cloud opperations.  

##### Use the standard error handeling functions in a seperate file to keep shell files clean 
```bash
wget https://raw.githubusercontent.com/jonathan-dale/bash/master/abort_die_info.bash
```
```bash
curl https://raw.githubusercontent.com/jonathan-dale/bash/master/abort_die_info.bash > abort_die_info.bash
```

Source these functions in a new shell file like this
```sh
#!/bin/bash
source abort_die_info.bash   ## Now the functions defined in about_die_info.bash are available in this shell
```
> note: the files must be in the same directory or use the full path
