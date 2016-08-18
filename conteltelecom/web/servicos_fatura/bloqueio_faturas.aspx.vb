Imports Telerik.Web.UI

Public Class bloqueio_faturas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            RadDropDownListMes.SelectedValue = Date.Today.Month
            RadDropDownListAno.SelectedValue = Date.Today.Year
            Dim mes01 As String = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue
            Dim dtaMesref As Date = "01/" & mes01
            Dim mes02 As String = If((dtaMesref.AddMonths(-1)).Month < 10, "0" & (dtaMesref.AddMonths(-1)).Month, (dtaMesref.AddMonths(-1)).Month) & "/" & (dtaMesref.AddMonths(-1)).Year
            Dim mes03 As String = If((dtaMesref.AddMonths(-2)).Month < 10, "0" & (dtaMesref.AddMonths(-2)).Month, (dtaMesref.AddMonths(-2)).Month) & "/" & (dtaMesref.AddMonths(-2)).Year
            SqlDataSourceBuscaClientes.SelectParameters("DtMes01").DefaultValue = mes01
            SqlDataSourceBuscaClientes.SelectParameters("DtMes02").DefaultValue = mes02
            SqlDataSourceBuscaClientes.SelectParameters("DtMes03").DefaultValue = mes03
            'linhas
            Session("DtMes01") = mes01
            Session("DtMes02") = mes02
            Session("DtMes03") = mes03


        End If
    End Sub

    Private Sub RadGridBloquiosFatura_PreRender(sender As Object, e As EventArgs) Handles RadGridBloquiosFatura.PreRender
        If IsPostBack = False Then
            Filtro()
        End If


    End Sub

    Sub Filtro()

        Dim mes01 As String = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue
        Dim dtaMesref As Date = "01/" & mes01
        Dim mes02 As String = If((dtaMesref.AddMonths(-1)).Month < 10, "0" & (dtaMesref.AddMonths(-1)).Month, (dtaMesref.AddMonths(-1)).Month) & "/" & (dtaMesref.AddMonths(-1)).Year
        Dim mes03 As String = If((dtaMesref.AddMonths(-2)).Month < 10, "0" & (dtaMesref.AddMonths(-2)).Month, (dtaMesref.AddMonths(-2)).Month) & "/" & (dtaMesref.AddMonths(-2)).Year

        'Dim header As GridHeaderItem = TryCast(RadGridBloquiosFatura.MasterTableView.GetItems(GridItemType.Header)(0), GridHeaderItem)

        'Dim Headermes01Label As Label = CType(header.FindControl("Headermes01Label"), Label)

        'Dim Headermes02Label As Label = CType(header.FindControl("Headermes02Label"), Label)

        'Dim Headermes03Label As Label = CType(header.FindControl("Headermes03Label"), Label)

        'Headermes01Label.Text = mes01
        'Headermes02Label.Text = mes02
        'Headermes03Label.Text = mes03
        For Each item As GridDataItem In RadGridBloquiosFatura.MasterTableView.Items


            Dim situacao As Label = TryCast(item.FindControl("situacaoLabel"), Label)
            If situacao.Text = "0 - AGUARDANDO FATURA" Then
                Dim RadImageButtonEditar As RadImageButton = TryCast(item.FindControl("RadImageButtonEditar"), RadImageButton)
                RadImageButtonEditar.Enabled = False

            End If



            'If CInt(situacao.Text.Substring(0, 3)) = 900 Then
            '    Dim RadImageButtonFuturar As RadImageButton = TryCast(item.FindControl("RadImageButtonFuturar"), RadImageButton)
            '    RadImageButtonFuturar.Enabled = False

            'End If
        Next



    End Sub




    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs)
        Dim mes01 As String = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue
        Dim dtaMesref As Date = "01/" & mes01
        Dim mes02 As String = If((dtaMesref.AddMonths(-1)).Month < 10, "0" & (dtaMesref.AddMonths(-1)).Month, (dtaMesref.AddMonths(-1)).Month) & "/" & (dtaMesref.AddMonths(-1)).Year
        Dim mes03 As String = If((dtaMesref.AddMonths(-2)).Month < 10, "0" & (dtaMesref.AddMonths(-2)).Month, (dtaMesref.AddMonths(-2)).Month) & "/" & (dtaMesref.AddMonths(-2)).Year
        SqlDataSourceBuscaClientes.SelectParameters("DtMes01").DefaultValue = mes01
        SqlDataSourceBuscaClientes.SelectParameters("DtMes02").DefaultValue = mes02
        SqlDataSourceBuscaClientes.SelectParameters("DtMes03").DefaultValue = mes03
        Session("DtMes01") = mes01
        Session("DtMes02") = mes02
        Session("DtMes03") = mes03
        RadGridBloquiosFatura.DataBind()

    End Sub

    Private Sub RadGridBloquiosFatura_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridBloquiosFatura.ItemCommand






        Dim mes01 As String = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue




        If e.CommandName = RadGrid.UpdateCommandName Then



            Dim autoCompleteBox As New RadAutoCompleteBox
            Dim id_ADM_CAD_TIPO_BLOQUEIO As Integer
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            autoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxSituacao"), RadAutoCompleteBox)
            Dim codMatriz_PS_CLIENTESLabelEdit As Label = DirectCast(eitem.FindControl("codMatriz_PS_CLIENTESLabel"), Label)
            For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                If entry.Text = autoCompleteBox.Text Then
                    id_ADM_CAD_TIPO_BLOQUEIO = Convert.ToInt32(entry.Value)
                End If
            Next
            SqlDataSourceBuscaClientes.UpdateParameters("id_ADM_CAD_TIPO_BLOQUEIO").DefaultValue = id_ADM_CAD_TIPO_BLOQUEIO
            SqlDataSourceBuscaClientes.UpdateParameters("id_codMatriz_PS_CLIENTES").DefaultValue = codMatriz_PS_CLIENTESLabelEdit.Text
            SqlDataSourceBuscaClientes.UpdateParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mes01
            SqlDataSourceBuscaClientes.Update()
        End If

        If e.CommandName = "Faturar" Then
            Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim codMatriz_PS_CLIENTESLabelEdit As Label = DirectCast(eitem.FindControl("codMatriz_PS_CLIENTESLabel"), Label)
            HttpContext.Current.Response.Redirect("~/web/clientes/relatorios/cl_rel_reducao.aspx?id_PS_PESSOA=" & codMatriz_PS_CLIENTESLabelEdit.Text & "&mesAnoRefereincia_SF_SERVICOS_FATURA=" & mes01)


        End If



    End Sub


End Class