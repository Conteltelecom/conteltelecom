Imports Telerik.Web.UI
Imports conteltelecom.Controles
Public Class ps_cidades_detalhes
    Inherits System.Web.UI.Page

    Protected Sub CancelButtonVoltar_Click(sender As Object, e As EventArgs)
        HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cidades.aspx")
    End Sub

    Private Sub ps_cidades_detalhes_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False Then
            If Request.QueryString("id_PS_CIDADES") = "0" Or IsNothing(Request.QueryString("id_PS_CIDADES")) = True Then
                RadDataFormCidades.IsItemInserted = True
                RadDataFormCidades.Rebind()
            End If

        End If
    End Sub

    Private Sub RadDataFormCidades_ItemCommand(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataFormCidades.ItemCommand
        Dim CLScontroles As New conteltelecom.Controles
        If e.CommandName = "Salvar" Then
            Dim Labelid_PS_CIDADES As Label = CType(RadDataFormCidades.Items(0).FindControl("Labelid_PS_CIDADES"), Label)
            Dim TextBoxdesc_PS_CIDADES As TextBox = CType(RadDataFormCidades.Items(0).FindControl("TextBoxdesc_PS_CIDADES"), TextBox)
            Dim RadComboBoxUF As RadComboBox = CType(RadDataFormCidades.Items(0).FindControl("RadComboBoxUF"), RadComboBox)
            Dim CheckBoxst_PS_CIDADES As CheckBox = CType(RadDataFormCidades.Items(0).FindControl("CheckBoxst_PS_CIDADES"), CheckBox)
            SqlDataSourceCidades.UpdateParameters("id_PS_CIDADES").DefaultValue = Labelid_PS_CIDADES.Text
            SqlDataSourceCidades.UpdateParameters("desc_PS_CIDADES").DefaultValue = CLScontroles.ProperCase(TextBoxdesc_PS_CIDADES.Text)
            SqlDataSourceCidades.UpdateParameters("cod_PS_UF").DefaultValue = Trim(RadComboBoxUF.SelectedValue)
            SqlDataSourceCidades.UpdateParameters("st_PS_CIDADES").DefaultValue = If(CheckBoxst_PS_CIDADES.Checked = True, 1, 0)


            SqlDataSourceCidades.Update()
            Response.Redirect(Request.RawUrl)

            '  RadDataFormCidades.IsItemInserted = False
            ' RadDataFormCidades.Rebind()
            ' RadDataFormCidades.DataBind()


        End If
        If e.CommandName = "PerformInsert" Then
            '  Dim Labelid_PS_PESSOA As Label = CType(RadDataFormCidades.Items(0).FindControl("Labelid_PS_PESSOA"), Label)
            Dim TextBoxdesc_PS_CIDADES As TextBox = CType(RadDataFormCidades.InsertItem.FindControl("TextBoxdesc_PS_CIDADES_Ins"), TextBox)
            Dim RadComboBoxUF As RadComboBox = CType(RadDataFormCidades.InsertItem.FindControl("RadComboBoxUF_Ins"), RadComboBox)
            Dim CheckBoxst_PS_CIDADES As CheckBox = CType(RadDataFormCidades.InsertItem.FindControl("CheckBoxst_PS_CIDADES_Ins"), CheckBox)
            SqlDataSourceCidades.InsertParameters("desc_PS_CIDADES").DefaultValue = CLScontroles.ProperCase(TextBoxdesc_PS_CIDADES.Text)
            SqlDataSourceCidades.InsertParameters("cod_PS_UF").DefaultValue = RadComboBoxUF.SelectedValue
            SqlDataSourceCidades.InsertParameters("st_PS_CIDADES").DefaultValue = If(CheckBoxst_PS_CIDADES.Checked = True, 1, 0)
            SqlDataSourceCidades.Insert()
            HttpContext.Current.Response.Redirect("~\web\pessoas\ps_cidades")
        End If
        CLScontroles = Nothing

    End Sub

    Private Sub RadDataFormCidades_ItemUpdated(sender As Object, e As RadDataFormUpdatedEventArgs) Handles RadDataFormCidades.ItemUpdated
        ' RadDataFormCidades.IsItemInserted = False
    End Sub

    Private Sub RadDataFormCidades_ItemUpdating(sender As Object, e As RadDataFormCommandEventArgs) Handles RadDataFormCidades.ItemUpdating
    End Sub

    Private Sub RadDataFormCidades_PreRender(sender As Object, e As EventArgs) Handles RadDataFormCidades.PreRender


        If RadDataFormCidades.Items.Count > 0 Then
            Dim RadDropDownListuF As RadComboBox
            RadDropDownListuF = DirectCast(RadDataFormCidades.Items(0).FindControl("RadComboBoxUF"), RadComboBox)
            Dim TextBoxUF As TextBox = DirectCast(RadDataFormCidades.Items(0).FindControl("TextBoxUF"), TextBox)
            If IsNothing(RadDropDownListuF) = False Then
                RadDropDownListuF.SelectedValue = TextBoxUF.Text
            End If
        Else

        End If


    End Sub
End Class