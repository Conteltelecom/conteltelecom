Imports System.Data.SqlClient


Public Class Sql
    Function BuscaConfiguracoesUsuario(ByVal id_PS_PESSOA As Integer) As Boolean
        Using con As New SqlConnection(StrConectionString)

            Using cmd As New SqlCommand("SELECT PS_PESSOA.st_PS_PESSOA
 FROM            USUARIOS INNER JOIN
                         PS_PESSOA ON USUARIOS.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA
 WHERE        (USUARIOS.st_USUARIOS = 1) AND
 (PS_PESSOA.st_PS_PESSOA = 1) AND 
 USUARIOS.id_PS_PESSOA=@id_PS_PESSOA")
                Try
                    Dim param As Data.SqlClient.SqlParameter
                    cmd.Connection = con
                    param = New Data.SqlClient.SqlParameter("@id_PS_PESSOA", Data.SqlDbType.Int)
                    param.Value = id_PS_PESSOA
                    cmd.Parameters.Add(param)

                    con.Open()
                    Dim rd As SqlDataReader = cmd.ExecuteReader()
                    If rd.HasRows = False Then
                        Return False
                    Else

                        Return True

                    End If

                Catch ex As Exception
                    Return False

                End Try
            End Using
        End Using



    End Function

    Public Function StrConectionString() As String

        Return System.Configuration.ConfigurationManager.ConnectionStrings.Item("conteltelecomConnectionString").ConnectionString

    End Function





End Class
