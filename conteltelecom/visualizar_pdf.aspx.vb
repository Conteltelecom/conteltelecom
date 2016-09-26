Imports System.Net

Public Class visualizar_pdf
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try


            Dim FilePath As String = Server.MapPath(Request.QueryString("caminho_ANEXOS_FATURAS") & Request.QueryString("id_ANEXOS_FATURAS") & ".pdf")

            Dim User As New WebClient()

            Dim FileBuffer As [Byte]() = User.DownloadData(FilePath)

            If FileBuffer IsNot Nothing Then
                If Request.QueryString("IsDownload") = 1 Then
                    Response.AddHeader("content-disposition", "attachment;filename=" & FilePath)

                Else


                    Response.AddHeader("content-disposition", "inline;filename=" & FilePath)
                End If

                Response.ContentType = "application/pdf"
                '  Response.AddHeader("Content-disposition", "inline; filename=\" & FilePath)
                '  Response.AddHeader("content-length", FileBuffer.Length.ToString())


                Response.BinaryWrite(FileBuffer)
            End If

        Catch ex As Exception

        End Try



    End Sub

End Class