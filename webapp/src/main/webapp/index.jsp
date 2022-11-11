<HTML>
    <HEAD>
    <TITLE>BITS Login</TITLE>
    </HEAD>
    
    <BODY background="image.jpg">
      <style>
          body {
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
          }
      </style>
      
    <SCRIPT>
      function validate() {
        if (document.forms[0].name.value=="") {
          alert("Please Enter the Name!");
          return false;
        }
        alert("Welcome to BITS Pilani!");
        return true;
      }
    </SCRIPT>
    <FORM onSubmit="return validate()">
    <P><BR><BR><BR>
    <FONT COLOR="BLACK" SIZE="4" >Enter the Name:
    <INPUT TYPE="text" NAME="name" size="35" VALUE="" align="middle">
    <BR><BR>
    <INPUT TYPE=SUBMIT VALUE="Submit" align="middle">
    <BR>
    <B><FONT COLOR=BLACK SIZE=4>
</TABLE>
</FORM>
</BODY>
</HTML>    