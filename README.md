# Dial Restrictions for Mexico's Mobile Numbers

As of August 3, 2019, Mexico's numbering plan will become closed to ten digits. After this date, all phone numbers should be dialed in a ten-digit format, even for local calls (**Mobile and Conventional Numbers**). Due to this change, the task for limit calls to mobile numbers in Mexican companies it becomes complex, this is why we have created an script to make this task easier for VitalPBX's implementers.

The numbering plan used for this script has been downloaded from the [IFT site (Federal Institute of Telecommunications)](https://sns.ift.org.mx:8081/sns-frontend/planes-numeracion/descarga-publica.xhtml).

To accomplish this task, we have added to the "**Dialing Restriction Rules**" module a special field (**Custom Rules Context**) that allows you to include a context with your own advanced rules.

![Dialing Restriction Rules](https://github.com/VitalPBX/dial-restrictions-mx/raw/master/source/dialing-restrictions.png)


### Installing the Script

- Get the installation Script
```
wget https://raw.githubusercontent.com/VitalPBX/dial-restrictions-mx/master/drmx.sh
```
- Set execution permissions to the Script
```
chmod +x drmx.sh
```
- Execute the Script
```
./drmx.sh
```

### Important Notes
- The number sent to the script must be exactly of 10 digits
