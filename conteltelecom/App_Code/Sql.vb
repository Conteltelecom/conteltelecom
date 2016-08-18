Imports System.Data.SqlClient


Public Class Sql


    Function StrConectionString() As String

        Return System.Configuration.ConfigurationManager.ConnectionStrings.Item("conteltelecomConnectionString").ConnectionString

    End Function

End Class
