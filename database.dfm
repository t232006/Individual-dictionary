object DataModule2: TDataModule2
  Height = 454
  Width = 418
  object sdvokab: TDataSource
    DataSet = vokab
    Left = 128
    Top = 24
  end
  object vokab: TTable
    Active = True
    AutoCalcFields = False
    AfterInsert = vokabAfterRefresh
    AfterPost = vokabAfterRefresh
    AfterDelete = vokabAfterRefresh
    AfterRefresh = vokabAfterRefresh
    DatabaseName = 'vokabul'
    Filtered = True
    FilterOptions = [foNoPartialCompare]
    TableName = 'vokab.DB'
    Left = 128
    Top = 72
    object vokabNumber: TAutoIncField
      DisplayLabel = 'N'
      DisplayWidth = 4
      FieldName = 'Number'
      ReadOnly = True
    end
    object vokabWord: TStringField
      DisplayLabel = #1057#1083#1086#1074#1086
      DisplayWidth = 13
      FieldName = 'Word'
      Required = True
      Size = 255
    end
    object vokabTranslate: TStringField
      DisplayLabel = 'Translation'
      DisplayWidth = 16
      FieldName = 'Translate'
      Required = True
      Size = 255
    end
    object vokabTopic: TIntegerField
      DisplayLabel = 'topic'
      DisplayWidth = 12
      FieldName = 'Topic'
      Required = True
    end
    object vokabDateRec: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 22
      FieldName = 'DateRec'
      Required = True
    end
    object vokabRate: TSmallintField
      DisplayLabel = #1054#1094#1077#1085#1082#1072
      DisplayWidth = 12
      FieldName = 'Rate'
    end
    object vokabtopicname: TStringField
      DisplayLabel = #1058#1077#1084#1072
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'topicname'
      LookupDataSet = top
      LookupKeyFields = 'Id'
      LookupResultField = 'Name'
      KeyFields = 'Topic'
      Size = 50
      Lookup = True
    end
    object vokabusersel: TBooleanField
      DisplayLabel = #1086#1090#1084#1077#1090#1082#1072
      DisplayWidth = 9
      FieldName = 'usersel'
      DisplayValues = ' '
    end
    object vokabtopicn: TStringField
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'topicn'
      LookupDataSet = top
      LookupKeyFields = 'Id'
      LookupResultField = 'Name'
      KeyFields = 'Topic'
      Lookup = True
    end
    object vokabFraza: TBooleanField
      FieldName = 'Fraza'
    end
    object vokabSeeked: TSmallintField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldName = 'Seeked'
    end
    object vokabspot: TBooleanField
      DefaultExpression = 'false'
      FieldName = 'spot'
    end
  end
  object top: TTable
    Active = True
    AutoCalcFields = False
    DatabaseName = 'vokabul'
    IndexFieldNames = 'Id'
    TableName = 'top.db'
    Left = 224
    Top = 80
    object topId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object topName: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1084#1099
      FieldName = 'Name'
      Size = 60
    end
  end
  object dstop: TDataSource
    DataSet = top
    Left = 224
    Top = 32
  end
  object dsless6: TDataSource
    DataSet = vokab
    Left = 304
    Top = 40
  end
  object less6: TQuery
    DatabaseName = 'vokabul'
    DataSource = dsless6
    SQL.Strings = (
      'update vokab'
      'set usersel=true'
      'where rate<6')
    Left = 296
    Top = 96
  end
  object topicquerly: TQuery
    DatabaseName = 'vokabul'
    DataSource = dstopicquerly
    SQL.Strings = (
      'update vokab set usersel=true where')
    Left = 224
    Top = 216
  end
  object dstopicquerly: TDataSource
    DataSet = top
    Left = 224
    Top = 160
  end
  object dropch: TQuery
    DatabaseName = 'vokabul'
    SQL.Strings = (
      'UPDATE vokab'
      'SET usersel=false')
    Left = 288
    Top = 368
  end
  object addball: TQuery
    DatabaseName = 'vokabul'
    Left = 40
    Top = 224
  end
  object dssynch: TDataSource
    DataSet = synch
    Left = 144
    Top = 280
  end
  object synch: TQuery
    AfterOpen = synchAfterOpen
    DatabaseName = 'vokabul'
    RequestLive = True
    SQL.Strings = (
      '')
    Left = 144
    Top = 328
  end
  object droprate: TQuery
    DatabaseName = 'vokabul'
    Left = 336
    Top = 368
  end
  object dspotential: TDataSource
    DataSet = potential
    Left = 56
    Top = 304
  end
  object potential: TQuery
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'vokabul'
    SQL.Strings = (
      'select sum(rate) as sumrate from vokab where usersel=true')
    Left = 56
    Top = 368
  end
  object selectsel: TQuery
    DatabaseName = 'vokabul'
    SQL.Strings = (
      'select * from vokab where usersel=true')
    Left = 344
    Top = 232
  end
  object dsselectsel: TDataSource
    DataSet = selectsel
    Left = 344
    Top = 168
  end
  object topic: TQuery
    Active = True
    AutoCalcFields = False
    DatabaseName = 'vokabul'
    SQL.Strings = (
      'select top.id, top.name, count(vokab.topic)'
      'from top left join vokab'
      'on vokab.topic=top.id'
      'group by id, name')
    Left = 136
    Top = 200
  end
  object dstopic: TDataSource
    DataSet = topic
    Left = 136
    Top = 144
  end
  object dropspot: TQuery
    DatabaseName = 'vokabul'
    SQL.Strings = (
      'update vokab'
      'set spot=false')
    Left = 240
    Top = 368
  end
end
