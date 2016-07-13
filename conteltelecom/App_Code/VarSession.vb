Public Class VarSession

    Inherits System.Web.UI.Page

    Sub CriaVarSessionLogin(ByVal id_PESSOA As Integer, ByVal idEmpresa_PS_PESSOA As Integer)

        Session("id_PESSOA") = id_PESSOA
        Session("idEmpresa_PS_PESSOA") = idEmpresa_PS_PESSOA

    End Sub


End Class
