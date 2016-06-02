Imports System.Windows

Public Class MasterPageCli
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            If IsNothing(Session("id_pessoaNav")) = True Then
                HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cliente.aspx")
            Else
                If IsNothing(Request.QueryString("consultaMatriz")) = True Then
                    Nav1.Visible = True
                    NavClienteMatriz.Visible = False
                    RadNavigationLinhas.Visible = False
                    Exit Sub
                End If

                Select Case Request.QueryString("consultaMatriz")
                    '0 MENU CNPJ
                    '1 MENU CLIENTES
                    '1 MENU LINHAS

                    Case 0

                        Nav1.Visible = True
                        NavClienteMatriz.Visible = False
                        RadNavigationLinhas.Visible = False
                        Exit Select
                    Case 1
                        Nav1.Visible = False
                        NavClienteMatriz.Visible = True
                        RadNavigationLinhas.Visible = False
                        Exit Select

                    Case 2
                        Nav1.Visible = False
                        NavClienteMatriz.Visible = False
                        RadNavigationLinhas.Visible = True
                        Exit Select

                End Select



            End If

            End If


    End Sub

    Private Sub LabelCliente_PreRender(sender As Object, e As EventArgs) Handles LabelCliente.PreRender
        If IsPostBack = False Then
            If (IsNothing(Request.QueryString("id_cliente")) = False And Request.QueryString("id_cliente") <> "0") Then
                LabelCliente.Text = "CLIENTE: " & UCase(Session("dadosCliente").ToString)



            End If
        End If
    End Sub

    Private Sub Nav1_PreRender(sender As Object, e As EventArgs) Handles Nav1.PreRender

          If IsPostBack = False Then
            If IsNothing(Request.QueryString("id_cliente")) = False Then
                '
                Nav1.Enabled = False
                For Each node In Nav1.Nodes

                    If Request.QueryString("id_cliente") = "0" Then
                        node.Enabled = False
                        node.Text = String.Empty
                        node.NavigateUrl = String.Empty
                    Else
                        Nav1.Enabled = True
                        node.Enabled = True
                    End If


                Next
            End If
        End If






    End Sub
End Class