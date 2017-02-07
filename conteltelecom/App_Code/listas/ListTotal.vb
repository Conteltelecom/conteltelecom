
Friend Class ListTotal
    Public Property CodBarras As String
    Public Property Valor As String
    Public Property Nome As String
    Public Property Id As String



    Public Sub New(ByVal codBarras As String, ByVal valor As String,
                   ByVal nome As String, ByVal id As String)
        Me.CodBarras = codBarras
        Me.Valor = valor
        Me.Nome = nome
        Me.Id = id
    End Sub
End Class

