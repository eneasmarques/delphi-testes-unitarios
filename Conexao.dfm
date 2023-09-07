object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 325
  Width = 465
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\PROJETOTESTES.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 152
    Top = 112
  end
  object FDQuery1: TFDQuery
    CachedUpdates = True
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvLockWait]
    UpdateOptions.LockWait = True
    SQL.Strings = (
      'select * from usuario')
    Left = 152
    Top = 160
  end
end
