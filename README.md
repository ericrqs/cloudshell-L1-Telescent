# cloudshell-L1-Telescent

Note that the unidirectional MapClearTo must perform a bidirectional "unlock" on the port because of an apparent bug in the switch (or at least the simulator) that prevents "unallocate" from working on a unidirectionally unlocked port.


Set SSH port and resource family and model names in telescent_runtime_configuration.json and telescent_datamodel.xml.


Copy telescent_runtime_configuration.json to c:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers

You must import telescent_datamodel.xml manually into RM first before dragging test_environment.zip will work. 

compile_driver.bat:
- kills all Telescent.exe 
- copies to c:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers:
  - .\dist\Telescent.exe 
  - .\telescent_runtime_configuration.json


To log in to the switch with an RSA private key

- Store it in this filename: C:\Windows\System32\Config\systemprofile\.ssh\id_rsa
- Ensure that the Paramiko connect() function in CloudShell-L1-networking-core ssh_session.py is called with look_for_keys=True
 
If id_rsa is found, the Password attribute of the switch will be used to decrypt the key file, and Username will still be used directly during login.
