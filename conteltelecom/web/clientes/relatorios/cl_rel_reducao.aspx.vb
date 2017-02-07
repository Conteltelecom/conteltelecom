Imports Microsoft.Reporting.WebForms
Imports Telerik.Web.UI

Public Class cl_rel_reducao
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then


            Dim Parametros As Integer = 1

            If IsNothing(Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA")) = True Then
                RadDropDownListMes.SelectedValue = Date.Today.Month.ToString("d2")
                RadDropDownListAno.SelectedValue = Date.Today.Year
            Else
                Dim mes As String = Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA").ToString.Substring(0, Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA").ToString.Length - 5)
                Dim ano As String = Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA").ToString.Substring(Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA").ToString.Length - 4)
                RadDropDownListMes.SelectedValue = mes
                RadDropDownListAno.SelectedValue = ano

            End If


            If IsNothing(Request.QueryString("id_PS_PESSOA")) = True Then
                Session("codMatriz_PS_CLIENTES") = ""
            Else
                If IsNothing(Request.QueryString("mesAnoRefereincia_SF_SERVICOS_FATURA")) = True Then
                    Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = Date.Today.Month.ToString("d2") & "/" & Date.Today.Year
                End If
                Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
                RadAutoCompleteBoxBuscaMatriz.Visible = False
                Label2.Visible = False
                If RadDropDownListTipoRel.SelectedValue = 2 Then
                    Parametros = 2
                End If

            End If
            If IsNothing(Request.QueryString("areaCliente")) = False Then
                Session("codMatriz_PS_CLIENTES") = Session("idEmpresa_PS_PESSOA")
                RadAutoCompleteBoxBuscaMatriz.Visible = False
                Label2.Visible = False
                RadDropDownListTipoRel.Visible = False
                LabelTipoRel.Visible = False
                If RadDropDownListTipoRel.SelectedValue = 2 Then
                    Parametros = 2
                End If

            End If
            Dim prmReport As New ReportParameter("tipoRel", Parametros)
            ReportViewerRelReducao.LocalReport.SetParameters(New ReportParameter() {prmReport})
            ReportViewerRelReducao.LocalReport.Refresh()
        End If
    End Sub

    Private Sub ReportViewerRelReducao_Load(sender As Object, e As EventArgs) Handles ReportViewerRelReducao.Load

    End Sub
    Protected Sub RadImageButtonGerar_Click(sender As Object, e As Telerik.Web.UI.ImageButtonClickEventArgs)

        If IsNothing(Request.QueryString("id_PS_PESSOA")) = True Then
            If IsNothing(RadAutoCompleteBoxBuscaMatriz) = False Then
                For Each entry As AutoCompleteBoxEntry In RadAutoCompleteBoxBuscaMatriz.Entries
                    If RadAutoCompleteBoxBuscaMatriz.Text = entry.Text Then
                        Session("codMatriz_PS_CLIENTES") = entry.Value
                    End If
                Next
            End If
        Else
            Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
        End If

        Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = RadDropDownListMes.SelectedValue & "/" & RadDropDownListAno.SelectedValue
        Dim Parametros As Integer = 1
        If RadDropDownListTipoRel.SelectedValue = 2 Then
            Parametros = 2
        End If

        If IsNothing(Request.QueryString("areaCliente")) = False Then
            Session("codMatriz_PS_CLIENTES") = Session("idEmpresa_PS_PESSOA")
            RadAutoCompleteBoxBuscaMatriz.Visible = False
            Label2.Visible = False
            RadDropDownListTipoRel.Visible = False
            LabelTipoRel.Visible = False
            If RadDropDownListTipoRel.SelectedValue = 2 Then
                Parametros = 2
            End If

        End If
        Dim prmReport As New ReportParameter("tipoRel", Parametros)

        ReportViewerRelReducao.LocalReport.SetParameters(New ReportParameter() {prmReport})

        ReportViewerRelReducao.LocalReport.Refresh()

    End Sub
End Class