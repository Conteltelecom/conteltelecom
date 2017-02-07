Imports System.Data.SqlClient

Public Class MesnagensEmail
    Sub BuscaValorVariaveis(ByRef Dic_VariveisMesnagem As Dictionary(Of String, String))

        Dim strConexao As New Sql

        Using con As New SqlConnection(strConexao.StrConectionString)

            Using cmd As New SqlCommand("SELECT contato_CH_SUBCHAMADOS,email_CH_SUBCHAMADOS  FROM CH_SUBCHAMADOS 
                                                                     WHERE id_CH_SUBCHAMADOS=@id_CH_SUBCHAMADOS")
                Try
                    Dim param As Data.SqlClient.SqlParameter
                    cmd.Connection = con
                    param = New Data.SqlClient.SqlParameter("@id_CH_SUBCHAMADOS", Data.SqlDbType.Int)
                    param.Value = Dic_VariveisMesnagem.Item("id_CH_SUBCHAMADOS")
                    cmd.Parameters.Add(param)

                    con.Open()
                    Dim rd As SqlDataReader = cmd.ExecuteReader()
                    If rd.HasRows = True Then
                        Dic_VariveisMesnagem.Add("email_CH_SUBCHAMADOS", rd("email_CH_SUBCHAMADOS"))
                        Dic_VariveisMesnagem.Add("contato_CH_SUBCHAMADOS", rd("email_CH_SUBCHAMADOS"))
                    End If

                Catch ex As Exception


                End Try
            End Using
        End Using


    End Sub

    Function BuscaMensagem(ByVal Dic_VariveisMesnagem As Dictionary(Of String, String)) As String
        Dim retorno As String = ""
        Dim strConexao As New Sql

        Using con As New SqlConnection(strConexao.StrConectionString)

            Using cmd As New SqlCommand("SELECT desc_CH_ASSINATURA,desc_CH_MENSAGENS FROM 
CH_MENSAGENS join CH_ASSINATURA 
ON CH_ASSINATURA.id_CH_ASSINATURA=CH_MENSAGENS.id_CH_ASSINATURA join
CH_STATUS 
ON CH_STATUS.id_CH_MENSAGENS =CH_MENSAGENS.id_CH_MENSAGENS
where id_CH_STATUS=@id_CH_STATUS")
                Try
                    Dim param As Data.SqlClient.SqlParameter
                    cmd.Connection = con
                    param = New Data.SqlClient.SqlParameter("@id_CH_STATUS", Data.SqlDbType.Int)
                    param.Value = Dic_VariveisMesnagem.Item("id_CH_STATUS")
                    cmd.Parameters.Add(param)

                    con.Open()
                    Dim rd As SqlDataReader = cmd.ExecuteReader()
                    If rd.HasRows = False Then
                        retorno = ""
                    Else
                        retorno = rd("desc_CH_MENSAGENS") & "<br/><hr/>" & "<br/" & rd("desc_CH_ASSINATURA")

                    End If

                Catch ex As Exception
                    Return retorno

                End Try
            End Using
        End Using
        '####################### VARIAVEIS PARA SUBSTITUIR ##########

        '%DESCRICAO%
        retorno = Replace(retorno, "%DESCRICAO%", Dic_VariveisMesnagem.Item("email_CH_SUBCHAMADOS"))
        '%CONTATO% 
        retorno = Replace(retorno, "%CONTATO% ", Dic_VariveisMesnagem.Item("contato_CH_SUBCHAMADOS"))

        Return retorno
    End Function


End Class
