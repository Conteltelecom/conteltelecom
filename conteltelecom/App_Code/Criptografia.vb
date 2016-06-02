Imports System.Text
Imports System.IO
Imports System.Security.Cryptography

Public Class Criptografia
    Private Shared chave As Byte() = {}
    Private Shared iv As Byte() = {12, 34, 56, 78, 90, 102,
        114, 126}


    Public Sub New()
    End Sub
    Public Shared Function Criptografar(valor As String, chaveCriptografia As String) As String
        Dim des As DESCryptoServiceProvider
        Dim ms As MemoryStream
        Dim cs As CryptoStream
        Dim input As Byte()

        Try
            des = New DESCryptoServiceProvider()
            ms = New MemoryStream()
            input = Encoding.UTF8.GetBytes(valor)
            chave = Encoding.UTF8.GetBytes(chaveCriptografia.Substring(0, 8))

            cs = New CryptoStream(ms, des.CreateEncryptor(chave, iv), CryptoStreamMode.Write)
            cs.Write(input, 0, input.Length)
            cs.FlushFinalBlock()

            Return Convert.ToBase64String(ms.ToArray())
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Shared Function Descriptografar(valor As String, chaveCriptografia As String) As String
        Dim des As DESCryptoServiceProvider
        Dim ms As MemoryStream
        Dim cs As CryptoStream
        Dim input As Byte()
        If String.IsNullOrEmpty(valor) Then
            valor = "1"
        End If

        Try
            des = New DESCryptoServiceProvider()
            ms = New MemoryStream()

            input = New Byte(valor.Length - 1) {}
            input = Convert.FromBase64String(valor.Replace(" ", "+"))

            chave = Encoding.UTF8.GetBytes(chaveCriptografia.Substring(0, 8))

            cs = New CryptoStream(ms, des.CreateDecryptor(chave, iv), CryptoStreamMode.Write)
            cs.Write(input, 0, input.Length)
            cs.FlushFinalBlock()

            Return Encoding.UTF8.GetString(ms.ToArray())
        Catch ex As Exception
            Throw ex
        End Try
    End Function
End Class



