select 
       --laudo_rx.cd_laudo,
       --laudo_rx.cd_ped_rx,
       to_char(ped_rx.dt_pedido,'DD/MM/YYYY')"DT.PEDIDO",
       --to_char(laudo_rx.dt_laudo,'DD/MM/YYYY')"DIA",
       --laudo_rx.nm_usuario, 
       ped_rx.cd_atendimento,
       paciente.nm_paciente,
       --set_exa.nm_set_exa,
       prestador.nm_prestador 
from ped_rx ped_rx
inner join atendime atendime
  on atendime.cd_paciente = ped_rx.cd_atendimento
inner join paciente paciente
  on paciente.cd_paciente = atendime.cd_paciente
inner join prestador prestador
 on prestador.cd_prestador = atendime.cd_prestador
INNER JOIN LAUDO_RX LAUDO_RX
  ON LAUDO_RX.CD_PED_RX = PED_RX.CD_PED_RX
/*inner join set_exa set_exa
  on set_exa.cd_set_exa = ped_rx.cd_set_exa
inner join itped_rx itped_rx
  on itped_rx.cd_laudo = laudo_rx.cd_laudo
and TRUNC (laudo_rx.DT_LAUDO) between '01/07/2020' and '31/07/2020'
and laudo_rx.cd_prestador IN ('1887','1917')*/
WHERE PED_RX.CD_PED_RX = '1709642'
and atendime.cd_multi_empresa = '3';
-----------------------------------------------------------------

SELECT LAUDO_RX.CD_LAUDO
      ,PED_RX.CD_PED_RX
      ,PED_RX.CD_PRESTADOR
      ,PRESTADOR.NM_PRESTADOR
      ,to_char(ped_rx.dt_pedido,'DD/MM/YYYY')"DT.PEDIDO"
      ,laudo_rx.dt_laudo
      ,PED_RX.CD_SET_EXA
      ,SET_EXA.NM_SET_EXA
      ,PED_RX.CD_ATENDIMENTO
      ,PACIENTE.NM_PACIENTE
FROM PED_RX PED_RX
INNER JOIN LAUDO_RX LAUDO_RX
  ON LAUDO_RX.CD_PED_RX = PED_RX.CD_PED_RX
INNER JOIN PRESTADOR PRESTADOR
  ON PRESTADOR.CD_PRESTADOR = PED_RX.CD_PRESTADOR
INNER JOIN ATENDIME ATENDIME
  ON ATENDIME.CD_ATENDIMENTO = PED_RX.CD_ATENDIMENTO
INNER JOIN PACIENTE PACIENTE
  ON PACIENTE.CD_PACIENTE = ATENDIME.CD_PACIENTE
INNER JOIN ITPED_RX ITPED_RX
  ON ITPED_RX.CD_PED_RX = PED_RX.CD_PED_RX
INNER JOIN SET_EXA SET_EXA
  ON SET_EXA.CD_SET_EXA = PED_RX.CD_SET_EXA
WHERE PED_RX.CD_SET_EXA = '39'
AND LAUDO_RX.CD_MULTI_EMPRESA = '3'
AND PED_RX.CD_PRESTADOR IN ('1887','1917')
AND LAUDO_RX.DT_LAUDO >= '01/07/2020' AND LAUDO_RX.DT_LAUDO <= '31/07/2020'
ORDER BY LAUDO_RX.DT_LAUDO,PACIENTE.NM_PACIENTE;

SELECT * FROM SET_EXA;
select* from laudo_rx
WHERE CD_PED_RX = '1709644';
WHERE CD_ATENDIMENTO = '202';
select * from ped_rx
WHERE CD_PED_RX = '1709644';
WHERE CD_ATENDIMENTO = '202';
SELECT * FROM ITPED_RX;
SELECT * FROM ATENDIME;