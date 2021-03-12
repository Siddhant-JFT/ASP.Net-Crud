<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUDHome.aspx.cs" Inherits="CRUD_Operations.CRUDHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col form-group">
                <%--<h1>Your Session: <asp:Label ID="Label1" runat="server"></asp:Label> is active.</h1>--%>
                <div class="container-fluid">
                    <div class="form-row">
                        <div class="col-sm-3">
                            <asp:Label ID="Label2" runat="server" Text="Name: "></asp:Label><input class="form-control" id="ename" type="text" runat="server" autoclear="true"/>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label ID="Label3" runat="server" Text="Email: "></asp:Label><input class="form-control" id="email" type="text" runat="server" autoclear="true"/>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label ID="Label4" runat="server" Text="Contact No: "></asp:Label><input class="form-control" id="econtact" type="text" runat="server" autoclear="true"/>
                        </div>
                        <div class="col-sm-3">
                            <asp:Label ID="Label5" runat="server" Text="Salary: "></asp:Label><input class="form-control" id="esalary" type="text" runat="server" autoclear="true"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-12" style="margin: 1% 40%;">
                           <input class="btn btn-primary" ID="btn_add" type="button" value="Add Record" onclick="AddRec()" />
                        </div>
                    </div>
                </div>
                <hr />
                <table style="width: 100%; height: 93px;">
                    <thead>
                        <tr>
                            <th>S. No.</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact No.</th>
                            <th>Salary</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    
                    <tbody id="lbltbl" runat="server">
                    </tbody>
                </table>                
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editModalLongTitle">Please change the data</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="Name">Name</label>
                      <input type="text" class="form-control" id="empname" placeholder="Name">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="email">Email</label>
                      <input type="email" class="form-control" id="empmail" placeholder="Email">
                    </div>
                </div>
              <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="Name">Contact No</label>
                      <input type="text" class="form-control" id="empcontact" placeholder="Contact">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="Name">Salary</label>
                      <input type="text" class="form-control" id="empsalary" placeholder="Salary">
                    </div>
                </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="update()" data-dismiss="modal">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    <!--Modal for Delete-->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Are you sure?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Confirm to delete the record.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteRec()">Delete</button>
      </div>
    </div>
  </div>
</div>
    <!--Alert Modal-->
    <!-- Modal -->
    <div class="modal fade" id="Alert Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="AlertModalTitle">Alert!!!</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
          </div>
        </div>
      </div>
    </div>
    <p id="testres"></p>
    <input type="hidden" value="" id="empid" />
    <script>
        //Add New Record
        function AddRec() {
            console.log("Add function called!")
            var ename = document.getElementById("MainContent_ename").value;
            var eemail = document.getElementById("MainContent_email").value;
            var econtact = document.getElementById("MainContent_econtact").value;
            var esalary = document.getElementById("MainContent_esalary").value;
            var numberFormat = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
            var efm = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+/;
            if (ename == "" || ename.length < 3 || econtact.length != 10 || esalary.length < 3) {
                if (econtact!=(numberFormat)) {
                    alert("Invalid Phone Number. Unable To Insert The Data. ");
                    return (false);
                } 
                //remove comments above and add else to if below
                else if (Number.isNaN(esalary)) {
                    alert("Invalid Value For Salary. Unable To Insert The Data. ");
                    return (false);
                }
                else {
                    alert("Unable To Insert The Data. ");
                    return (false);
                }
            }
            if (!/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(eemail)) {
                alert("Invalid Email Address. Unable To Insert The Data. ");
                return (false);
            }
            
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "add.aspx?name=" + ename + "&email=" + eemail + "&contact=" + econtact + "&salary=" + esalary, false);
            xmlhttp.send(null);

            document.getElementById("MainContent_ename").value = "";
            document.getElementById("MainContent_email").value = "";
            document.getElementById("MainContent_econtact").value = "";
            document.getElementById("MainContent_esalary").value = "";
            refresh();
            xmlhttp.abort; 
        }
        //Identifier for the record updater
        function updateEmp(sid) {
            fill(sid);
            document.getElementById("empid").value = sid;
        }
        //Fill Data on Edit Record Modal
        function fill(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "DataFill.aspx?id=" + id, false);
            xmlhttp.send(null);
            var responseString = xmlhttp.responseText.toString();
            var indexofsplitter = responseString.indexOf("|", 0);
            var initialIndex = 0;
            var values = [];
            for (i = 0; i < 4; i++) {
                values[i] = responseString.substring(initialIndex, indexofsplitter);
                initialIndex = indexofsplitter + 1;
                indexofsplitter = responseString.indexOf("|", indexofsplitter + 1);
            }
            document.getElementById("empname").value = values[0];
            document.getElementById("empmail").value = values[1];
            document.getElementById("empcontact").value = values[2];
            document.getElementById("empsalary").value = values[3];
            xmlhttp.abort;
        }
        //For-Updating any Record
        function update() {
            var name = document.getElementById("empname").value;
            var email = document.getElementById("empmail").value;
            var contact = document.getElementById("empcontact").value;
            var salary= document.getElementById("empsalary").value;
            var id = document.getElementById("empid").value;

            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "Edit.aspx?id=" + id + "&name=" + name + "&email=" + email + "&contact=" + contact + "&salary=" + salary, false);
            xmlhttp.send(null);

            document.getElementById("empname").value = "";
            document.getElementById("empmail").value = "";
            document.getElementById("empcontact").value = "";
            document.getElementById("empsalary").value = "";
            document.getElementById("empid").value = "";
            refresh();
        }
        //Identifier For the Delete Button
        function del(sid) {
            document.getElementById("empid").value = sid;
        }
        //For Deletin an record
        function deleteRec() {
            var id = document.getElementById("empid").value;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "Delete.aspx?id=" + id, false);
            xmlhttp.send(null);
            document.getElementById("empid").value = "";
            refresh();
            xmlhttp.abort;
        }
        //Refreshes the Employee Details Table
        function refresh() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "refresh.aspx", false);
            xmlhttp.send(null);
            document.getElementById("MainContent_lbltbl").innerHTML = xmlhttp.responseText;
            //xmlhttp.abort;
        }
    </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</asp:content>