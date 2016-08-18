Public Class VarSession

    Inherits System.Web.UI.Page

    Sub CriaVarSessionLogin(ByVal id_PESSOA As Integer, ByVal idEmpresa_PS_PESSOA As Integer)


        Session("id_PS_PESSOA_USUARIO") = id_PESSOA
        Session("idEmpresa_PS_PESSOA") = idEmpresa_PS_PESSOA

    End Sub

    Function ValidaSessao() As Boolean
        Try


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
