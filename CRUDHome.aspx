<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUDHome.aspx.cs" Inherits="CRUD_Operations.CRUDHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--Add Modal-->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="addModalLongTitle">Please Fill This Form</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="form-row">
                    <div class="col-md-6" style="margin-top: 10px;">
                        <asp:Label ID="Label2" runat="server" Text="Name: "></asp:Label><input class="form-control" id="ename" type="text" runat="server" autoclear="true" />
                    </div>
                    <div class="col-md-6" style="margin-top: 10px;">
                        <asp:Label ID="Label3" runat="server" Text="Email: "></asp:Label><input class="form-control" id="email" type="text" runat="server" autoclear="true" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6" style="margin-top: 10px;">
                        <asp:Label ID="Label4" runat="server" Text="Contact No: "></asp:Label><input class="form-control" id="econtact" type="text" runat="server" autoclear="true" />
                    </div>
                    <div class="col-md-6" style="margin-top: 10px;">
                        <asp:Label ID="Label5" runat="server" Text="Salary: "></asp:Label><input class="form-control" id="esalary" type="text" runat="server" autoclear="true" />
                        <br />
                    </div>
                </div>

                <div class="form-row">
                    <div class="custom-file" style="padding: 6px 10px;">
                       
                        <label class="" for="customFileLang">Select Image: </label>
                        <input type="file" class="custom-file-input btn-secondary" id="fileUpload" style="display: inline-block">
                        <progress id="fileProgress" style="display: none"></progress>
                        <hr />
                        <span id="lblMessage" style="color: Green"></span>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btnout btn-secondary" style="margin-top: 10px;" data-dismiss="modal">Close</button>
                    <button type="button" id="btn_add" style="margin-top: 10px;" class="btn btn-primary" value="Add Record" onclick="AddRec()" data-dismiss="modal">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!--Add Modal End-->

    <!--Add Modal Trigger Button-->
    <div class="container">
        <div class="row">
            <div class="col form-group">
                <button type="button" class="btn btn-info btnout" data-toggle="modal" data-target="#addModal">Add New Record</button>
                <hr />
                <table style="width: 100%; height: 93px; margin-left: 20px;">
                    <thead>
                        <tr>
                            <th class='col-sm-1'>S. No.</th>
                            <th class='col-sm-2'>Name</th>
                            <th class='col-sm-3'>Email</th>
                            <th class='col-sm-2'>Contact No.</th>
                            <th class='col-sm-1'>Salary</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>

                    <tbody id="lbltbl" runat="server">
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLongTitle">Please change the data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div>
                    <div class="form-row">
                        <div class="form-group col-md-6" style="margin-top: 10px;">
                            <label for="Name">Name</label>
                            <input type="text" class="form-control" id="empname" placeholder="Name">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 10px;">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="empmail" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6" style="margin-top: 10px;">
                            <label for="Name">Contact No</label>
                            <input type="text" class="form-control" id="empcontact" placeholder="Contact">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 10px;">
                            <label for="Name">Salary</label>
                            <input type="text" class="form-control" id="empsalary" placeholder="Salary">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btnout btn-secondary" style="margin-top: 10px;" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btnout btn-primary" style="margin-top: 10px;" onclick="update()" data-dismiss="modal">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <!--Delete Modal-->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLongTitle">Are you sure?</h3>
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

    <!--Image Modal-->
    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="AlertModalTitle">Uploaded Image</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                  <img style="width: 400px; height: 350px; border:none; outline:none; " id="empimage" alt=":/">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <p id="testres"></p>
    <input type="hidden" value="" id="empid" />

    <!--Script Here-->
    <script>
        //Add New Record
        var fileName; 

        function afterValidation() {
            document.getElementById("MainContent_econtact").style.borderColor = "black";
            document.getElementById("MainContent_ename").style.borderColor = "black";
            document.getElementById("MainContent_email").style.borderColor = "black";
            document.getElementById("MainContent_esalary").style.borderColor = "black";
        }
        function AddRec() {
            imageUpload();
            console.log("Add function called!");
            var ename = document.getElementById("MainContent_ename").value;
            var eemail = document.getElementById("MainContent_email").value;
            var econtact = document.getElementById("MainContent_econtact").value;
            var esalary = document.getElementById("MainContent_esalary").value;
            
            if (econtact.length != 10) {
                document.getElementById("MainContent_econtact").style.borderColor = "red";
                document.getElementById('btn_add').setAttribute("data-dismiss", "none");
            }
            else {
                document.getElementById("MainContent_econtact").style.borderColor = "green";
            }

            if (esalary.length < 3) {
                document.getElementById("MainContent_esalary").style.borderColor = "red";
                document.getElementById('btn_add').setAttribute("data-dismiss", "none");
            }
            else {
                document.getElementById("MainContent_esalary").style.borderColor = "green";
            }
            if (ename.length < 2) {
                document.getElementById("MainContent_ename").style.borderColor = "red";
                document.getElementById('btn_add').setAttribute("data-dismiss", "none");
            }
            else {
                document.getElementById("MainContent_ename").style.borderColor = "green";
            }
            if (!/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(eemail)) {
               document.getElementById("MainContent_email").style.borderColor = "red";
                document.getElementById('btn_add').setAttribute("data-dismiss", "none");
                return (false);
            }
            else {
                document.getElementById("MainContent_email").style.borderColor = "green";
            }

            afterValidation();
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "add.aspx?name=" + ename + "&email=" + eemail + "&contact=" + econtact + "&salary=" + esalary + "&image=" + fileName, false);
            xmlhttp.send(null);

            document.getElementById("MainContent_ename").value = "";
            document.getElementById("MainContent_email").value = "";
            document.getElementById("MainContent_econtact").value = "";
            document.getElementById("MainContent_esalary").value = "";
            refresh();
            xmlhttp.abort;
            document.getElementById('btn_add').setAttribute("data-dismiss", "modal");
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
           // console.log(responseString)
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
        //Show Image Button Calls this
        function showImage(sid) {
            document.getElementById("empid").value.sid;
            displayImage(sid);
        }
        //To Show Image
        function displayImage(id) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST", "ImageDisplay.aspx?id=" + id, false);
            xmlhttp.send(null);
            var responseString = xmlhttp.responseText.toString();
            var indexofsplitter = responseString.indexOf("|", 0);
            var initialIndex = 0;
            var values = [];
            // console.log(responseString)
            for (i = 0; i < 1; i++) {
                values[i] = responseString.substring(initialIndex, indexofsplitter);
                initialIndex = indexofsplitter + 1;
                indexofsplitter = responseString.indexOf("|", indexofsplitter + 1);
            }
            document.getElementById("empimage").src = "./Images/"+values[0];
            xmlhttp.abort;
        }
        //For-Updating any Record
        function update() {
            var name = document.getElementById("empname").value;
            var email = document.getElementById("empmail").value;
            var contact = document.getElementById("empcontact").value;
            var salary = document.getElementById("empsalary").value;
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
        //Upload Image
        function imageUpload() {
            var fd = new FormData();
            var files = $('#fileUpload')[0].files;
            if (files.length > 0) {
                fd.append('file', files[0]);
            }
            $.ajax({
                url: 'ImageUploader.ashx',
                type: 'POST',
                data: fd,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (file) {
                    fileName = file.name;
                    $("#fileProgress").hide();
                },
                xhr: function () {
                    var fileXhr = $.ajaxSettings.xhr();
                    if (fileXhr.upload) {
                        $("progress").show();
                        fileXhr.upload.addEventListener("progress", function (e) {
                            if (e.lengthComputable) {
                                $("#fileProgress").attr({
                                    value: e.loaded,
                                    max: e.total
                                });
                            }
                        }, false);
                    }
                    return fileXhr;
                }
            });
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
</asp:Content>
