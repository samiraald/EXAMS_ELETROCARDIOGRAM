CREATE OR REPLACE FORCE VIEW VDIC_ELETROCARDIOGRAMA (
       CD_LAUDO --1
      ,CD_PED_RX --2
      ,CD_PRESTADOR --3
      ,NM_PRESTADOR --4
      ,DT_PEDIDO --5
      ,DT_LAUDO --6
      ,DT_LAUDO_FORMATADO
      ,CD_SET_EXA --7
      ,NM_SET_EXA --8
      ,CD_ATENDIMENTO --9
      ,NM_PACIENTE --10
) AS

SELECT LAUDO_RX.CD_LAUDO
      ,PED_RX.CD_PED_RX
      ,PED_RX.CD_PRESTADOR
      ,PRESTADOR.NM_PRESTADOR
      ,to_char(ped_rx.dt_pedido,'DD/MM/YYYY')"DT.PEDIDO"
      ,laudo_rx.dt_laudo
      ,to_char(laudo_rx.dt_laudo,'DD/MM/YYYY') DT_LAUDO_FORMATADO
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
--AND TRUNC(LAUDO_RX.DT_LAUDO) BETWEEN '01/07/2020' AND '31/07/2020'
ORDER BY LAUDO_RX.DT_LAUDO,PACIENTE.NM_PACIENTE
/
GRANT SELECT ON VDIC_ELETROCARDIOGRAMA TO biconexao;
GRANT SELECT ON VDIC_ELETROCARDIOGRAMA TO dbacp WITH GRANT OPTION;
GRANT SELECT ON VDIC_ELETROCARDIOGRAMA TO dbaportal WITH GRANT OPTION;
GRANT DELETE,INSERT,SELECT,UPDATE ON VDIC_ELETROCARDIOGRAMA TO dbaps;
GRANT DELETE,INSERT,SELECT,UPDATE ON VDIC_ELETROCARDIOGRAMA TO dbasgu;
GRANT DELETE,INSERT,SELECT,UPDATE ON VDIC_ELETROCARDIOGRAMA TO mv2000;
GRANT DELETE,INSERT,SELECT,UPDATE ON VDIC_ELETROCARDIOGRAMA TO mvintegra;