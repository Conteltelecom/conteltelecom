
Public Class ac_faturas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub




    ' ação do botao limpar no filtro
    Private Sub RadButtonLimpar_Click(sender As Object, e As EventArgs) Handles RadButtonLimpar.Click
        Dim CLScontroles As New conteltelecom.Controles
        CLScontroles.Limpar(Me)
        CLScontroles = Nothing
        RadDatePickerMesReferencia.Clear()
        RadDatePickerVencimento.Clear()
    End Sub




    Private Sub RadGridAcFaturas_PreRender(sender As Object, e As EventArgs) Handles RadGridAcFaturas.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridAcFaturas, 3)
            RadGridAcFaturas.Rebind()
        End If
    End Sub


    ' ação do botao pesquisar
    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs)

        If RadDatePickerVencimento.DateInput.SelectedDate.ToString <> "" Then
            Dim periodo_vencimento As String = RadDatePickerVencimento.DateInput.SelectedDate

            SqlDataSourceFaturas.SelectParameters("dtVencimento_SF_LEITURA_FATURA_Mes").DefaultValue = Month(periodo_vencimento)
            SqlDataSourceFaturas.SelectParameters("dtVencimento_SF_LEITURA_FATURA_Ano").DefaultValue = Year(periodo_vencimento)
            '   SqlDataSourceFaturas.SelectCommand = SqlDataSourceFaturas.SelectCommand & " AND MONTH(SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA) = '" & Month(periodo_vencimento) & "' AND YEAR(SF_LEITURA_FATURA.dtVencimento_SF_LEITURA_FATURA) = '" & Year(periodo_vencimento) & "'"
        End If

        If RadDatePickerMesReferencia.DateInput.SelectedDate.ToString <> "" Then
            Dim mes_referencia As String = RadDatePickerMesReferencia.DateInput.SelectedDate
            SqlDataSourceFaturas.SelectParameters("mesReferencia_SF_LEITURA_FATURA_Mes").DefaultValue = Month(mes_referencia)
            SqlDataSourceFaturas.SelectParameters("mesReferencia_SF_LEITURA_FATURA_Ano").DefaultValue = Year(mes_referencia)


            ' SqlDataSourceFaturas.SelectCommand = SqlDataSourceFaturas.SelectCommand & " AND SF_LEITURA_FATURA.mesReferencia_SF_LEITURA_FATURA = '" & Month(mes_referencia) & "/" & Year(mes_referencia) & "'"
        End If

        ' SqlDataSourceFaturas.SelectCommand = SqlDataSourceFaturas.SelectCommand & " ORDER BY Mes DESC "
        RadGridAcFaturas.DataBind()

    End Sub

    Private Sub SqlDataSourceFaturas_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSourceFaturas.Selecting

    End Sub
End Class