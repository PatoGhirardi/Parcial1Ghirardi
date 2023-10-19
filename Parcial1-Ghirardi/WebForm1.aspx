<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Parcial1_Ghirardi.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Añadir Marca<asp:TextBox ID="TextBox1" runat="server"  ></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionBBDD %>" DeleteCommand="DELETE FROM [AutomovilMarcas] WHERE [id] = @id" InsertCommand="INSERT INTO [AutomovilMarcas] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT * FROM [AutomovilMarcas]" UpdateCommand="UPDATE [AutomovilMarcas] SET [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            Añadir Vehiculo<asp:TextBox ID="TextBox2" runat="server"  ></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Seleccione Marca: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" Text="Add" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                    <asp:BoundField DataField="idAutomovilMarca" HeaderText="idAutomovilMarca" SortExpression="idAutomovilMarca" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button3" runat="server" Text="Filtrar" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Des-Filtrar" OnClick="Button4_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionBBDD %>" DeleteCommand="DELETE FROM [Automoviles] WHERE [id] = @id" InsertCommand="INSERT INTO [Automoviles] ([modelo], [idAutomovilMarca]) VALUES (@modelo, @idAutomovilMarca)" SelectCommand="SELECT Automoviles.id, Automoviles.modelo, Automoviles.idAutomovilMarca, AutomovilMarcas.nombre FROM Automoviles INNER JOIN AutomovilMarcas ON Automoviles.idAutomovilMarca = AutomovilMarcas.id" UpdateCommand="UPDATE [Automoviles] SET [modelo] = @modelo, [idAutomovilMarca] = @idAutomovilMarca WHERE [id] = @id" OnSelecting="SqlDataSource1_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="modelo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idAutomovilMarca" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="modelo" Type="String" />
                    <asp:Parameter Name="idAutomovilMarca" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
