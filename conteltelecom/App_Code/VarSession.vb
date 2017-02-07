Imports System.Data.SqlClient

Public Class VarSession

    Inherits System.Web.UI.Page

    Sub CriaVarSessionLogin(ByVal id_PESSOA As Integer, ByVal idEmpresa_PS_PESSOA As Integer)
        Dim id_PS_PERMISSAO As Integer
        Dim id_PS_EMPRESAS As Integer
        BuscaConfiguracoesUsuario(id_PESSOA, id_PS_PERMISSAO, id_PS_EMPRESAS)
        Session("id_PS_PESSOA_USUARIO") = id_PESSOA
        Session("idEmpresa_PS_PESSOA") = idEmpresa_PS_PESSOA
        Session("id_PS_PERMISSAO") = id_PS_PERMISSAO
        Session("id_PS_EMPRESAS") = id_PS_EMPRESAS
        Session("dateValidaUsuarios") = Date.Now
    End Sub
    Sub BuscaConfiguracoesUsuario(ByVal id_PS_PESSOA As Integer, ByRef id_PS_PERMISSAO As Integer, ByRef id_PS_EMPRESAS As Integer)


        Dim CslSqlConetion As New Sql


        Using con As New SqlConnection(CslSqlConetion.StrConectionString)

            Using cmd As New SqlCommand("SELECT USUARIOS.id_USUARIOS, USUARIOS.idEmpresa_PS_PESSOA, USUARIOS.id_PS_PERMISSAO, USUARIOS.atendeChamado_USUARIOS, PS_SETOR_USUARIO.id_CH_SETORES FROM USUARIOS INNER JOIN PS_SETOR_USUARIO ON USUARIOS.id_USUARIOS = PS_SETOR_USUARIO.id_USUARIOS WHERE (USUARIOS.id_PS_PESSOA = @id_PS_PESSOA)")
                Try
                    Dim param As Data.SqlClient.SqlParameter
                    cmd.Connection = con
                    param = New Data.SqlClient.SqlParameter("@id_PS_PESSOA", Data.SqlDbType.Int)
                    param.Value = id_PS_PESSOA
                    cmd.Parameters.Add(param)

                    con.Open()
                    Dim rd As SqlDataReader = cmd.ExecuteReader()

                    While rd.Read()

                        id_PS_EMPRESAS = rd("idEmpresa_PS_PESSOA")
                        id_PS_PERMISSAO = rd("id_PS_PERMISSAO")
                    End While
                Catch ex As Exception


                End Try
            End Using
        End Using



    End Sub
    Function ValidaSessao() As Boolean
        Try

            'Valida se conta de Usaário esta ativa na banco esta validação é a cada 5 minitos
            If DateDiff(DateInterval.Minute, Session("dateValidaUsuarios"), Date.Now) > 5 Then
                Dim ClassSql As New Sql
                If ClassSql.BuscaConfiguracoesUsuario(CInt(Session("id_PS_PESSOA_USUARIO"))) = False Then

                    ClassSql = Nothing
                    Return False
                Else
                    Session("id_PS_EMPRESAS") = Date.Now
                    ClassSql = Nothing

                End If

            End If



            If IsNothing(Session("id_PS_PESSOA_USUARIO")) = False And System.Web.HttpContext.Current.User.Identity.IsAuthenticated = True Then

                Return True

            Else
                Return False

            End If
        Catch ex As Exception
            Return False
        End Try

    End Function


End Class
