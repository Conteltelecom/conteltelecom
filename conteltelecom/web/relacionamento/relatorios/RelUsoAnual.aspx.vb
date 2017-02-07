Public Class RelUsoAnual
    Inherits System.Web.UI.Page

    Public Function Func_Ultimo_Dia_Mes(paramDataX As Date) As Date
        Func_Ultimo_Dia_Mes = DateAdd("m", 1, DateSerial(Year(paramDataX), Month(paramDataX), 1))
        Func_Ultimo_Dia_Mes = DateAdd("d", -1, Func_Ultimo_Dia_Mes)
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then


            ObjectDataSourceBuscUsoAnual.SelectParameters("DtIni").DefaultValue = "01/" & Month(Date.Now) & "/" & Year(Date.Now)
            ObjectDataSourceBuscUsoAnual.SelectParameters("DtFim").DefaultValue = Func_Ultimo_Dia_Mes(Date.Now)

            RadDatePickerMesIni.SelectedDate = ObjectDataSourceBuscUsoAnual.SelectParameters("DtIni").DefaultValue
            RadDatePickerFinal.SelectedDate = ObjectDataSourceBuscUsoAnual.SelectParameters("DtFim").DefaultValue
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



        ObjectDataSourceBuscUsoAnual.SelectParameters("DtIni").DefaultValue = "01/" & Month(RadDatePickerMesIni.DateInput.SelectedDate) & "/" & Year(RadDatePickerMesIni.DateInput.SelectedDate)
        ObjectDataSourceBuscUsoAnual.SelectParameters("DtFim").DefaultValue = "28/" & Month(RadDatePickerFinal.DateInput.SelectedDate) & "/" & Year(RadDatePickerFinal.DateInput.SelectedDate)

        RadDatePickerMesIni.SelectedDate = ObjectDataSourceBuscUsoAnual.SelectParameters("DtIni").DefaultValue
        RadDatePickerFinal.SelectedDate = Func_Ultimo_Dia_Mes(ObjectDataSourceBuscUsoAnual.SelectParameters("DtFim").DefaultValue)
        ReportViewerUsoAnual.LocalReport.Refresh()
        ReportViewerUsoAnual.DataBind()



    End Sub
End Class