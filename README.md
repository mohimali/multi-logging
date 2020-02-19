# Logging Kubectl files
This script allows you to log multiple files

Change the kube-services uses the delimiter ";"
The below line has 3 sections. 
- custom-service-name1 - Pick what you want your service to be identified by
- The number 2 is a colour. You can pick 3,4,5,6,7,8,9,10
- chosen-namespace is the namespace of your pods
- The last section after the ; can be any command you chose. This one prints out logs based on a label
```
custom-service-name1;2;kubectl -n chosen-namespace logs -l chosen-label -f
```

## Usage
```
./logging.sh kube-services
```

## Example Output
```
  custom-service-name1 lots of logging for service-name1  
  custom-service-name2 lots of logging for service-name2 
  custom-service-name1 lots of logging for service-name1 
  custom-service-name2 lots of logging for service-name2
  custom-service-name1 lots of logging for service-name1 
  custom-service-name2 lots of logging for service-name2
```