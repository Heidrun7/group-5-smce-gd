# SPRINT 4

| Task ID |Description| Complexity (small/medium/large) | Justification
|:----------:|-------|:------:|------|
| T3 | Group Meetings| S | Most often efficient and resulted in valuable content. Can take a lot of time but highly useful. |
| T4 | Supervision | S | Communication with TA. |
| T5 | Documentation | M | |
| T7 | Administrative | S | Updating product backlog making sure tasks are included on task list etc. |
| T9| Stakeholder Communication | S | Communication via text on discord, meetings etc. |
| T10 | Milestone 4 Preperation. Creating and preparing presentation and class demo. Creating Task List (sprint backlog) for next sprint. | S |  |
| T14 | DevTool Proposal | M | Coming up with an idea and working on clarifying it to be able to form a DevTool Proposal. Thinking of implementations, MVP and metrics that could be used. |
| T15 | Fix camera bugg camera goes under the ground. | |
| T16 | Help window. Adding a help window for instructions on how to drive the emulated car.  | M | Teamwork towards a good solution to the task. Mainly godot learning curve figuring out how different parts connect and can be used together. Reacting to stakeholder feedback and implementing a different solution. |
| T17 | Change the way the locked on orbit camera position is calculated so that the camera can operate without adding extra nodes into the tree. | |

| Name                         | Task ID | Contribution in % |
| ---------------------------- | :-----: | :---------------: |
| Asad Maraj                   |T3 </br> T14 </br>||
| Birgitta Feldis Bjarkadottir |T3 </br> T7 </br> T9 </br> T14 </br> T16|  </br> </br> </br> </br> 33% | 
| Heidrun Valdis Heidarsdottir |T3 </br> T14 </br> T16|  </br>  </br> 33% |
| Henrik Lagergren             |T3 </br> T14 </br>||
| Johannes Gustavsson          |T3 </br> T14 </br>||
| Pontus Lindblom              |T3 </br> T14 </br> T16|  </br>  </br> 33% |

# SPRINT 3

| Task ID |Description| Complexity (small/medium/large) | Justification
|:----------:|-------|:------:|------|
| T3 | Group Meetings| S | Were efficient and worked well in most cases. Did take many hours. |
| T4 | Supervision | S | Short meetings with TA. |
| T5 | Documentation: All documentation regarding the project, mainly for understanding the project better or explaining it better to future users. </br> Commenting files to explain functionality of classes and increase both readability and maintainability. | M | Creating a new read me INSTALLATION GUIDE both for Windows and Mac. </br> Commenting many files created in godot, did take a lot of background research because of lack of godot experience. |
| T7 | Administrative | S | Small tasks related to the project such as setting up the git repo. Mainly simple tasks. |
| T8 | Research: Mainly on Godot and C++ to be able to work with the SMCE framework. | M | Everyone took sufficient amount of time before being able to start on tasks, getting to know the framework and how to work with it. |
| T9| Stakeholder Communication | S | |
| T10 | Milestone 3 Preperation. Creating and preparing presentation and class demo. Creating Task List. | S | - |
| T11 | Increase test coverage of libSMCE | M | Added tests to test/Board.cpp, test/BoardView.cpp and test/Toolchain.cpp and set up the code analysis tools Sonarcloud and Codecov |
| T12 | Bug fix, fix so that the camera values are as they were before refactoring interpolated camera | S | Just a copy and paste job. |
| T13 | Implement a way for environments to describe where the vehicle should be spawned. | M | Finding a solution that did not take too much time and satiesfies the customer was a bit tricky. |


| Name                         | Task ID | Contribution in % |
| ---------------------------- | :-----: | :---------------: |
| Asad Maraj                   | T3 </br>                                               T10 </br>     T11       | 16.6% </br> 45% </br> 10%                  |
| Birgitta Feldis Bjarkadottir | T3 </br> T4 </br>          T7 </br> T8 </br>    T9 </br> T10 </br>  T11   | 16.6% </br> 20% </br> 25% </br> 50% </br> 23.3% </br> 45% </br> 30% |
| Heidrun Valdis Heidarsdottir | T3 </br> T4 </br>          T7 </br>             T9 </br> T10 </br>  T11         | 16.6% </br> 20% </br> 25% </br> 15% </br> 10% </br> 30%       |
| Henrik Lagergren             | T3 </br> T4 </br>          T8 </br>            T9 </br>            T11         | 16.6% </br> 20% </br> 50% </br> 15% </br> 30%                      |
| Johannes Gustavsson          | T3 </br> T4 </br>          T7 </br>             T9 </br>                    T12 </br>   T13 | 16.6% </br> 20% </br> 25% </br> 23.3% </br> 100% </br> 50% |
| Pontus Lindblom              | T3 </br> T4 </br> T5 </br> T7 </br>             T9 </br>                                T13 | 16.6% </br> 20% </br> 100% </br> 25% </br> 23.3% </br> 50%                   |


# SPRINT 2
| Task ID |Description|  Complexity (small/medium/large) | Justification
|:----------:|-------|:------:|------|
| T1 |Refactor Camera so it does not use the Interpolated Camera at it will be deprecated with the Release of Godot 4.0. |M| 4 files modified </br> 1 file added </br> required background work both  before and during task as a first godot programming experience. 
| T2 | Refactoring. Moving the CamCtl responsibilities into the ControllableCamera class itself, thereby removing unneccesary class. | M | 6 files modified </br> 1 file removed </br> required background work both  before and during task as a first godot programming experience. </br> Took additional time figuring out in which Camera class to place the CamCtrl (Controllable Camera). |
| T3 | Group Meetings| S | Were efficient and worked well in most cases. Did take many hours. |
| T4 | Supervision | S | Short meetings with TA. |
| T5 | Documentation: All documentation regarding the project, mainly for understanding the project better or explaining it better to future users. </br> Commenting files to explain functionality of classes and increase both readability and maintainability. | M | Creating a new read me INSTALLATION GUIDE both for Windows and Mac. </br> Commenting many files created in godot, did take a lot of background research because of lack of godot experience. |
| T6 | With help of sonarcloud we managed to find duplicated code in BoardView.cpp. The duplicated code was extracted from four different functions and added to a new function (which all of those four old functions then calling). | S | 2 files modified. </br> The task was needed since it is unncessecary with code duplication. The task was a small since sonarcloud helped us to find the duplication and it wasn't the largest of them, however we had to do all the extraction by ourselves and learn/understand the file/functions.|
| T7 | Administrative | S | Small tasks related to the project such as setting up the git repo. Mainly simple tasks. |
| T8 | Research: Mainly on Godot and C++ to be able to work with the SMCE framework. | M | Everyone took sufficient amount of time before being able to start on tasks, getting to know the framework and how to work with it. |
| T9| Stakeholder Communication | S | Through text in very usefull discussions on Discord. |
| T10 | Milestone 2 Preperation. Creating and preparing presentation and class demo.  Creating Task List. | S | -  |
| T12 | Bug fix, fix so that the camera values are as they were before refactoring interpolated camera | S | Just a copy and paste jobb  |


| Name |Task ID|  Contribution in % | 
|----------|:-------------:|:------:|
|Asad Maraj  | T3 </br> T4 </br> T5 </br> T7 </br> T8 </br>| 16.6% </br> 16.6% </br> 25% </br> 15% </br> 16.6% 
|Birgitta Feldis Bjarkadottir  | T1 </br> T2 </br> T3 </br> T4 </br> T7 </br> T8 </br> T9 </br> T10| 30% </br> 70% </br> 16.6% </br> 16.6% </br> 15% </br> 16.6% </br> 50% </br> 33%
|Heidrun Valdis Heidarsdottir  |T3 </br> T4 </br> T5 </br> T7 </br> T8 </br>|16.6% </br> 16.6% </br> 25% </br> 20% </br> 16.6% 
|Henrik Lagergren  | T3 </br> T4 </br> T5 </br> T6 </br> T7 </br> T8 </br> |16.6% </br> 16.6% </br> 25% </br> 100% </br> 15% </br> 16.6% 
|Johannes Gustavsson  | T1 </br> T2 </br> T3 </br> T4 </br> T7 </br> T8 </br> T9 </br> T10 </br> T12| 70% </br> 30% </br> 16.6% </br> 16.6% </br> 15% </br> 16.6% </br> 50% </br> 33% </br> 100%
|Pontus Lindblom  | T3 </br> T4 </br> T5 </br> T7 </br> T8 </br> T10 |16.6% </br> 16.6% </br> 25% </br> 20% </br> 16.6% </br> 33%

    
