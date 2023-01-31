Dockerized Fake Data Producer For Aiven for Apache Kafka®
=========================================================

This project aims at creating a Docker version of the [Apache Kafka® Python Fake Data Producer](https://github.com/aiven/python-fake-data-producer-for-apache-kafka). 

Overview
========

The Dockerized Fake Data Producer For Aiven for Apache Kafka®, requires:

* An Aiven valid account and login Token
* An Aiven for Apache Kafka instance already created

The `run.sh` will:

* login using username and token
* pull all the required information (hostname, port, certificates) from Aiven for Apache Kafka
* create the topic (if the topic is already exist you'll see an error)
* create the messages

Prerequisites
=============

The Dockerized Fake Data Producer For Aiven for Apache Kafka, requires:

* An Aiven valid account and login Token
* An Aiven for Apache Kafka instance already created

Setup
============

1. clone the repository and navigate to the `fake-data-producer-for-apache-kafka-docker` folder

2. copy the `conf/env.conf.sample` to `conf/env.conf` and edit the following parameters

| Parameter Name | Parameter Value                                                                                                              |
|----------------|------------------------------------------------------------------------------------------------------------------------------|
|PROJECT_NAME    | Name of the Aiven Project where the Aiven for Apache Kafka service is running                                                |
|SERVICE_NAME    | Name of the Aiven for Apache Kafka service running                                                                           |
|TOPIC           | Name of the Topic to write messages in                                                                                       |
|PARTITIONS      | Number of partitions to set when creating a topic (this will **NOT** alter existing topics)                                  |
|REPLICATION     | Number of replicas to set when creating a topic (this will **NOT** alter existing topics)                                    |
|NR_MESSAGES     | Overall number of messages to produce (0 for unlimited))                                                                     |
|MAX_TIME        | Max time in seconds between messages (0 for no wait)                                                                         |
|SUBJECT         | Fake data subject (One between `pizza`, `userbehaviour`, `stock`, `realstock` (using the yahoo finance apis) and `metric`)   |
|USERNAME        | Aiven account username                                                                                                       |
|TOKEN           | Aiven account token                                                                                                          |
|PRIVATELINK     | Flag to say if the service is under a privatelink, to fetch the correct URL                                                  |
|SECURITY        | Flag to say if the Kafka service is using SSL or not, possible values are ``SSL`` or ``PLAINTEXT``                           |


To know more about parameters, check the underline [Apache Kafka Python Fake Data Producer](https://github.com/aiven/python-fake-data-producer-for-apache-kafka) repository.

3. Build the docker image

```
docker build -t fake-data-producer-for-apache-kafka-docker .
```

4. Run the docker image

```
docker run -t -i fake-data-producer-for-apache-kafka-docker
```

5. Check the Fake messages being produced

![Streaming Data](images/streaming-data.gif)

You can stop the fake data generator with Control-C

License
============
Dockerized Fake Data Producer For Aiven for Apache Kafka is licensed under the Apache license, version 2.0. Full license text is available in the [LICENSE](LICENSE) file.

Please note that the project explicitly does not require a CLA (Contributor License Agreement) from its contributors.

Contact
============
Bug reports and patches are very welcome, please post them as GitHub issues and pull requests at https://github.com/aiven/fake-data-producer-for-apache-kafka-docker . 
To report any possible vulnerabilities or other serious issues please see our [security](SECURITY.md) policy.

Apache Kafka is either a registered trademark or trademark of the Apache Software Foundation in the United States and/or other countries. Aiven has no affiliation with and is not endorsed by The Apache Software Foundation.
