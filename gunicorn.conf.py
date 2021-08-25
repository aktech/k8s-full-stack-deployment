import os
import multiprocessing

bind = "0.0.0.0:8080"

if os.environ.get('ENVIRONMENT') != 'production':
    num_of_workers = 1
else:
    num_of_workers = multiprocessing.cpu_count() + 1

workers = num_of_workers
timeout = 5*60
