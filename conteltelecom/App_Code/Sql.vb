Imports System.Data.SqlClient
Imports Microsoft.ReportingServices.DataProcessing

Public Class Sql


    Function StrConectionString() As String

        Return System.Configuration.ConfigurationManager.ConnectionStrings.Item("conteltelecomConnectionString").ConnectionString

    End Function

End Class
