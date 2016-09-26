Imports Telerik.Web.UI

Public Class li_cad_filhas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridLinhasFilhas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLinhasFilhas.ItemCommand

        If e.CommandName = RadGrid.PerformInsertCommandName Then

            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)

            Dim CheckBoxListLinhas As New CheckBoxList
            CheckBoxListLinhas = DirectCast(eitem.FindControl("CheckBoxListLinhas"), CheckBoxList)



            For Each item As ListItem In CheckBoxListLinhas.Items
                If item.Selected = True Then

                    SqlDataSourceLinhasFilhas.InsertParameters("id_LI_LINHAS").DefaultValue = item.Value
                    SqlDataSourceLinhasFilhas.InsertParameters("id_LI_CAD_LINHA_CHAVE").DefaultValue = Request.QueryString("id_LI_CAD_LINHA_CHAVE")
                    SqlDataSourceLinhasFilhas.InsertParameters("id_PS_PESSOA_alt").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceLinhasFilhas.InsertParameters("id_PS_PESSOA_inc").DefaultValue = Session("id_PS_PESSOA_USUARIO")
                    SqlDataSourceLinhasFilhas.Insert()

                End If



            Next



        End If

    End Sub

    Private Sub RadGridLinhasFilhas_PreRender(sender As Object, e As EventArgs) Handles RadGridLinhasFilhas.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridLinhasFilhas, 1)
            RadGridLinhasFilhas.MasterTableView.Caption = "<span style='font-weight:bold;color:black;text-align:center;'>LINHA CHAVE " & Request.QueryString("codLinha_LI_LINHAS") & " </span>"
            RadGridLinhasFilhas.Rebind()
        End If
    End Sub
End Class


