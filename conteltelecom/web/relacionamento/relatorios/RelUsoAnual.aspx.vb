Public Class RelUsoAnual
    Inherits System.Web.UI.Page

    Public Function Func_Ultimo_Dia_Mes(paramDataX As Date) As Date
        Func_Ultimo_Dia_Mes = DateAdd("m", 1, DateSerial(Year(paramDataX), Month(paramDataX), 1))
        Func_Ultimo_Dia_Mes = DateAdd("d", -1, Func_Ultimo_Dia_Mes)
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then

            Dim ano As String = Year(Date.Now)
            Dim mes As String = Month(Date.Now)
            If CInt(mes) < 10 Then
                mes = "0" & mes

            End If


            Session("mesFim") = mes
            Session("mesIni") = mes
            Session("AnoIni") = ano
            Session("AnoFim)") = ano


            RadDatePickerMesIni.SelectedDate = "01/" & mes & "/" & Year(Date.Now)
            RadDatePickerFinal.SelectedDate = Func_Ultimo_Dia_Mes(Date.Now)
            ReportViewerUsoAnual.LocalReport.Refresh()
            ReportViewerUsoAnual.DataBind()


        End If

    End Sub

    Function RetornaMesses(ByVal mesIni As Date, ByVal mesFim As Date) As String
        Dim retorno As String = ""
        While mesIni < mesFim
            If retorno = "" Then
                retorno = Month(mesFim) & "/" & Year(mesFim)
            Else
                retorno = retorno & "," & Month(mesFim) & "/" & Year(mesFim)
            End If
            mesFim = mesFim.AddMonths(-1)
        End While
        Return retorno


    End Function


    Protected Sub RadButtonPesquisar_Click(sender As Object, e As EventArgs) Handles RadButtonPesquisar.Click



        Session("mesFim") = "0" & Month(RadDatePickerFinal.DateInput.SelectedDate)
        Session("mesIni") = "0" & Month(RadDatePickerMesIni.DateInput.SelectedDate)
        Session("AnoIni") = Year(RadDatePickerMesIni.DateInput.SelectedDate)
        Session("AnoFim)") = Year(RadDatePickerFinal.DateInput.SelectedDate)


        ReportViewerUsoAnual.LocalReport.Refresh()
        ReportViewerUsoAnual.DataBind()



    End Sub
End Class