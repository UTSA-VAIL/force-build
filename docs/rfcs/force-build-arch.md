# Force Build Architecture

## Background

The lab, ideally, will have frequent usage and turnover of projects with many of the core details changing, such as model architecture or training methods. In order to get started on a new project, we would need to start from 0 every time.

#### Definitions
- Pipeline: an automated workflow of predefined sequentially run code separated into stages, which expect certain things on success from each of the stages predecessors
- Artifacts: a piece of data that is saved from an automation pipeline
- Polling: periodic requests for data and/or updates from a running pipeline
- Make: referring to GNU Make -- aka make files
- YAML: Yet Another Markup Language, used primarily for process automation with workflows and pipelines by creating the scope/content of each stage

#### Nomenclature



## Motivation 
As the lab scales in size and number of projects grows with it, we will have an increasing need of a quick way to bounce between projects. 
Currently, the level of effort involved in context switching to a new project is a bit unwieldy. Additionally, there are oftentimes a large need for extremely robust ablation studies, which will need to be tested under the same environment and constraints as the other implementations. Both of these issues can be solved with an easy to use framework of Force Build using a design approach of modularity and scalability.

## Proposal: Force Build
<p align="center">
  <img src="../imgs/ForceBuild.png" />
</p>


#### Summary

####  Dataloader Streamlining

#### Model Build/Training Streamlining 

#### Evaluations as a Service

#### Version Control