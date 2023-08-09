cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  monoclonal-gammopathy-of-undetermined-significance-mgus-paraproteinaemia---primary:
    run: monoclonal-gammopathy-of-undetermined-significance-mgus-paraproteinaemia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  monoclonal---primary:
    run: monoclonal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: monoclonal-gammopathy-of-undetermined-significance-mgus-paraproteinaemia---primary/output
  monoclonal-gammopathy-of-undetermined-significance-mgus---primary:
    run: monoclonal-gammopathy-of-undetermined-significance-mgus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: monoclonal---primary/output
  monoclonal-gammopathy-undetermined-significance-monoclonal-gammopathy-of-undetermined-significance-mgus---secondary:
    run: monoclonal-gammopathy-undetermined-significance-monoclonal-gammopathy-of-undetermined-significance-mgus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: monoclonal-gammopathy-of-undetermined-significance-mgus---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: monoclonal-gammopathy-undetermined-significance-monoclonal-gammopathy-of-undetermined-significance-mgus---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
