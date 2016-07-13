Imports System.Net.NetworkInformation
Imports System.DirectoryServices
Imports System.Data.SqlClient
Imports System.Data
Imports System.Web

Public Class autenticacao
    Inherits System.Web.UI.Page


    Public Function Autentica(ByVal IpServer As String, ByVal User As String, ByVal Senha As String, ByRef resutado As String) As Boolean

        Dim VarSession As New VarSession
        Dim idEmpresa_PS_PESSOA As Integer = 0
        Dim tipoErro As Integer = 0
        Dim id_PS_PESSOA As Integer = 0
        Dim StrConectionString As New Sql
        Dim constr As String = StrConectionString.StrConectionString.ToString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Validate_User")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@username_USUARIOS", User)
                cmd.Parameters.AddWithValue("@password_USUARIOS", Senha)
                cmd.Parameters.Add("@tipoErro", SqlDbType.Int)
                cmd.Parameters.Add("@id_PS_PESSOA", SqlDbType.Int)
                cmd.Parameters.Add("@idEmpresa_PS_PESSOA", SqlDbType.Int)

                cmd.Parameters("@idEmpresa_PS_PESSOA").Direction = ParameterDirection.Output
                cmd.Parameters("@tipoErro").Direction = ParameterDirection.Output
                cmd.Parameters("@id_PS_PESSOA").Direction = ParameterDirection.Output
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
                tipoErro = cmd.Parameters("@tipoErro").Value.ToString()
                id_PS_PESSOA = cmd.Parameters("@id_PS_PESSOA").Value.ToString()
            End Using
            Select Case tipoErro
                Case 0
                    Return False
                    Exit Select
                Case -1
                    'SENHA INVALIDA
                    resutado = "Atenção!!!!!! SENHA INCORETA"
                    Return False
                    Exit Select
                Case -2
                    resutado = "Atenção!!!!!! CONTA BLOQUEADA"
                    Return False
                    Exit Select
                Case -3
                    resutado = "Atenção!!!!!! Servidor de autenticação com problemas"
                    Return False
                    Exit Select
                Case -4
                    resutado = "Atenção!!!!!! USURARIO INVÁLIDO"
                    Return False
                    Exit Select
                Case -5
                    Try
                        Dim ipPrincipal As String = "192.168.1.12"
                        Dim ipSecundario As String = "192.168.1.20"

                        If ReturPing(ipPrincipal) = True Then
                            Return AdAutentica(ipPrincipal, User, Senha, resutado)
                            Session("FirstName") = id_PS_PESSOA
                        ElseIf ReturPing(ipSecundario) = True Then
                            Return AdAutentica(ipSecundario, User, Senha, resutado)
                            Session("FirstName") = id_PS_PESSOA
                        Else
                            resutado = "Atenção!!!!!! Servidor de autenticação com problemas"
                        End If
                    Catch ex As Exception

                        Return False
                    End Try

                    Return False
                    Exit Select
                Case Else
                    VarSession.CriaVarSessionLogin(id_PS_PESSOA, idEmpresa_PS_PESSOA)
                    Return True
                    Exit Select
            End Select
        End Using












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
