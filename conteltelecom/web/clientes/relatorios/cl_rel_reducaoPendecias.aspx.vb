Imports Telerik.Web.UI

Public Class cl_rel_reducaoPendecias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ClsBuscaMesAnoAtual As New conteltelecom.Validacoes
        If IsPostBack = False Then

            RadTextBoxMesAno.Text = ClsBuscaMesAnoAtual.BuscaMesAnoAtual
            If IsNothing(Request.QueryString("id_PS_PESSOA")) = True Then
                Session("codMatriz_PS_CLIENTES") = ""
            Else

                Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = RadTextBoxMesAno.TextWithLiterals
                Session("codMatriz_PS_CLIENTES") = Request.QueryString("id_PS_PESSOA")
                RadAutoCompleteBoxBuscaMatriz.Visible = False
                Label2.Visible = False
                ReportViewerRelReducao.LocalReport.Refresh()
            End If
        End If
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

        Session("mesAnoRefereincia_SF_SERVICOS_FATURA") = RadTextBoxMesAno.TextWithLiterals

        ReportViewerRelReducao.LocalReport.Refresh()

    End Sub
End Class