Imports Telerik.Web.UI

Public Class bloqueio_faturas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            RadDropDownListMes.SelectedValue = Date.Today.Month
            RadDropDownListAno.SelectedValue = Date.Today.Year

        End If
    End Sub

    Private Sub RadGridBloquiosFatura_PreRender(sender As Object, e As EventArgs) Handles RadGridBloquiosFatura.PreRender
        If IsPostBack = False Then
            Dim mes01 As String = If(RadDropDownListMes.SelectedValue < 9, "0" & RadDropDownListMes.SelectedValue, RadDropDownListMes.SelectedValue) & "/" & RadDropDownListAno.SelectedValue
            Dim dtaMesref As Date = "01/" & mes01
            Dim mes02 As String = If((dtaMesref.AddMonths(-1)).Month < 10, "0" & (dtaMesref.AddMonths(-1)).Month, (dtaMesref.AddMonths(-1)).Month) & "/" & (dtaMesref.AddMonths(-1)).Year
            Dim mes03 As String = If((dtaMesref.AddMonths(-2)).Month < 10, "0" & (dtaMesref.AddMonths(-2)).Month, (dtaMesref.AddMonths(-2)).Month) & "/" & (dtaMesref.AddMonths(-2)).Year

            For Each item As GridDataItem In RadGridBloquiosFatura.MasterTableView.Items

                Dim codMatriz_PS_CLIENTESLabel As Label = TryCast(item.FindControl("codMatriz_PS_CLIENTESLabel"), Label)
                Dim mes01Label As Label = TryCast(item.FindControl("mes01Label"), Label)
                Dim mes02Label As Label = TryCast(item.FindControl("mes02Label"), Label)
                Dim mes03Label As Label = TryCast(item.FindControl("mes03Label"), Label)
                Dim situacaoLabel As Label = TryCast(item.FindControl("situacaoLabel"), Label)
                Dim strSituacao As String = ""
                mes01Label.Text = buscavaloresMes(CInt(codMatriz_PS_CLIENTESLabel.Text.ToString), mes01, strSituacao)
                mes02Label.Text = buscavaloresMes(CInt(codMatriz_PS_CLIENTESLabel.Text.ToString), mes02, "")
                mes03Label.Text = buscavaloresMes(CInt(codMatriz_PS_CLIENTESLabel.Text.ToString), mes03, "")
                situacaoLabel.Text = strSituacao
            Next
            RadGridBloquiosFatura.Rebind()
        End If


    End Sub

    Function buscavaloresMes(ByVal codMatriz_PS_CLIENTESLabel As Integer, ByVal mesAnoRefereincia_SF_SERVICOS_FATURA As String,
                             ByRef desc_ADM_CAD_TIPO_BLOQUEIO As String) As Decimal

        SqlDataSourceBuscaValorMes.SelectParameters("mesAnoRefereincia_SF_SERVICOS_FATURA").DefaultValue = mesAnoRefereincia_SF_SERVICOS_FATURA
        SqlDataSourceBuscaValorMes.SelectParameters("codMatriz_PS_CLIENTES").DefaultValue = codMatriz_PS_CLIENTESLabel

        Dim dvSql1 As DataView = CType(SqlDataSourceBuscaValorMes.Select(DataSourceSelectArguments.Empty), DataView)
        If dvSql1 IsNot Nothing Or dvSql1.Count < 0 Then
            For Each drvSql As DataRowView In dvSql1
                If IsDBNull(drvSql("vlTotalIncluido_SF_SERVICOS_FATURA")) = False Then


                End If
                If IsDBNull(drvSql("vlTotalIncluido_SF_SERVICOS_FATURA")) = False Then
                    Return CDec(drvSql("vlTotalIncluido_SF_SERVICOS_FATURA").ToString)
                End If

            Next

        End If


        Return 0

    End Function


End Class