Imports Telerik.Web.UI

Public Class ps_uf_detalhes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            If Request.QueryString("cod_PS_UF") = "0" Then
                RadDataFormUF.IsItemInserted = True
                RadDataFormUF.Rebind()
            End If

        End If
    End Sub

    Protected Sub CancelButtonVoltar_Click(sender As Object, e As EventArgs)
        HttpContext.Current.Response.Redirect("~\web\pessoas\ps_uf.aspx")
    End Sub

    Private Sub RadDataFormUF_ItemCommand(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataFormUF.ItemCommand

        Dim CLScontroles As New conteltelecom.Controles
        Try


            If e.CommandName = "Update" Then
                Dim TextBoxcod_PS_UF_ins As Label = CType(RadDataFormUF.Items(0).FindControl("id_PS_CIDADESLabel"), Label)
                Dim TextBoxdesc_PS_UF_ins As TextBox = CType(RadDataFormUF.Items(0).FindControl("TextBoxdesc_PS_UF"), TextBox)
                Dim CheckBoxSituacao_ins As CheckBox = CType(RadDataFormUF.Items(0).FindControl("CheckBoxSituacao"), CheckBox)
                SqlDataSourceUF.UpdateParameters("cod_PS_UF").DefaultValue = (TextBoxcod_PS_UF_ins.Text).ToUpper
                SqlDataSourceUF.UpdateParameters("desc_PS_UF").DefaultValue = CLScontroles.ProperCase(TextBoxdesc_PS_UF_ins.Text)
                SqlDataSourceUF.UpdateParameters("st_PS_UF").DefaultValue = If(CheckBoxSituacao_ins.Checked = True, 1, 0)
                SqlDataSourceUF.Update()
                RadDataFormUF.DataBind()

            End If

            If e.CommandName = "PerformInsert" Then
                Dim TextBoxcod_PS_UF_ins As TextBox = CType(RadDataFormUF.InsertItem.FindControl("TextBoxcod_PS_UF_ins"), TextBox)
                Dim TextBoxdesc_PS_UF_ins As TextBox = CType(RadDataFormUF.InsertItem.FindControl("TextBoxdesc_PS_UF_ins"), TextBox)
                Dim CheckBoxSituacao_ins As CheckBox = CType(RadDataFormUF.InsertItem.FindControl("CheckBoxSituacao_ins"), CheckBox)
                SqlDataSourceUF.InsertParameters("cod_PS_UF").DefaultValue = TextBoxcod_PS_UF_ins.Text.ToUpper
                SqlDataSourceUF.InsertParameters("desc_PS_UF").DefaultValue = CLScontroles.ProperCase(TextBoxdesc_PS_UF_ins.Text)
                SqlDataSourceUF.InsertParameters("st_PS_UF").DefaultValue = If(CheckBoxSituacao_ins.Checked = True, 1, 0)
                SqlDataSourceUF.Insert()
                HttpContext.Current.Response.Redirect("~\web\pessoas\ps_uf.aspx")

            End If

        Catch ex As Exception

        End Try
        CLScontroles = Nothing
    End Sub
End Class