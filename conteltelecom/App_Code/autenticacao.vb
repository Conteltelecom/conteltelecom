Imports System.Net.NetworkInformation
Imports System.DirectoryServices

Public Class autenticacao


    Public Function Autentica(ByVal IpServer As String, ByVal User As String, ByVal Senha As String, ByRef resutado As String) As Boolean
        Try

            Dim ipPrincipal As String = "192.168.1.12"
            Dim ipSecundario As String = "192.168.1.20"

            If ReturPing(ipPrincipal) = True Then
                Return AdAutentica(ipPrincipal, User, Senha, resutado)

            ElseIf ReturPing(ipSecundario) = True Then
                Return AdAutentica(ipSecundario, User, Senha, resutado)

            Else
                resutado = "Atenção!!!!!! Servidor de autenticação com problemas"
                Return False
            End If
        Catch ex As Exception

            Return False
        End Try


    End Function
    Public Function AdAutentica(ByVal IpServer As String, ByVal User As String, ByVal Senha As String, ByRef resutado As String) As Boolean
        Try
            Dim oAD As DirectoryEntry = New DirectoryEntry("LDAP://" + IpServer, User, Senha)

            resutado = oAD.Name
            Return True

        Catch ex As Exception

            resutado = ex.Message
            Return False

        End Try

    End Function
    Function ReturPing(ByVal ip As String) As Boolean

        Try
            If My.Computer.Network.Ping(ip) Then
                Return True
            Else
                Return False

            End If
        Catch ex As Exception
            Return False
        End Try

        Return False
    End Function

End Class
