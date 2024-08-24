from llama_index.core import VectorStoreIndex, SimpleDirectoryReader
from llama_index.core import StorageContext
from redis import Redis
from llama_index.vector_stores.redis import RedisVectorStore
import fire


def createDB():
    """Create database."""
    # load documents
    data_dir = "~/workspace/second-brain/org-roam/"
    documents = SimpleDirectoryReader(data_dir).load_data()
    print(
        "Document ID:",
        documents[0].id_,
        "Document Filename:",
        documents[0].metadata["file_name"],
    )

    # create a Redis client connection
    redis_client = Redis.from_url("redis://localhost:6379")

    # create the vector store wrapper
    vector_store = RedisVectorStore(redis_client=redis_client, overwrite=True)

    # load storage context
    storage_context = StorageContext.from_defaults(vector_store=vector_store)

    # build and load index from documents and storage context
    index = VectorStoreIndex.from_documents(
        documents, # storage_context=storage_context,
        show_progress=True
    )
    # index = VectorStoreIndex.from_vector_store(vector_store=vector_store)

    return


if __name__ == '__main__':
    fire.Fire(
        {
            "create_db": createDB,
        }
    )
