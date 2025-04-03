

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Operadora',
            fields=[
                ('registro_ans', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('cnpj', models.CharField(max_length=20)),
                ('razao_social', models.CharField(max_length=255)),
                ('nome_fantasia', models.CharField(blank=True, max_length=255)),
                ('modalidade', models.CharField(max_length=100)),
                ('logradouro', models.CharField(max_length=255)),
                ('numero', models.CharField(max_length=20)),
                ('complemento', models.CharField(blank=True, max_length=100)),
                ('bairro', models.CharField(max_length=100)),
                ('cidade', models.CharField(max_length=100)),
                ('uf', models.CharField(max_length=2)),
                ('cep', models.CharField(max_length=8)),
                ('ddd', models.CharField(max_length=2)),
                ('telefone', models.CharField(max_length=20)),
                ('fax', models.CharField(blank=True, max_length=20)),
                ('endereco_eletronico', models.EmailField(blank=True, max_length=255)),
                ('representante', models.CharField(max_length=255)),
                ('cargo_representante', models.CharField(max_length=100)),
                ('regiao_comercializacao', models.CharField(max_length=2)),
                ('data_registro_ans', models.DateField()),
            ],
            options={
                'db_table': 'operadoras',
                'ordering': ['razao_social'],
            },
        ),
    ]
