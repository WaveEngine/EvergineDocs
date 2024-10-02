import os
import sys
import time
import concurrent.futures

# Check Python version
if sys.version_info < (3, 6):
    print("This script requires Python 3.6 or higher!")
    sys.exit(1)

# Check if the 'openai' library is installed
try:
    import openai
except ImportError:
    print("The 'openai' library is not installed. Please install it using 'pip install openai'.")
    sys.exit(1)

# Get the OpenAI API key
OPENAI_API_KEY = os.getenv('OPENAI_API_KEY')
if OPENAI_API_KEY is None:
    raise ValueError("Please set the OPENAI_API_KEY environment variable")
    
openai.api_key = OPENAI_API_KEY

def improve_grammar(text):
    prompt = (
        "Improve the grammar of the following English text, "
        "but do not alter image URLs, source code, or code variables:\n\n"
        "{}"
    ).format(text)

    response = openai.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt}
        ],
        #max_tokens=8192 - len(prompt.split()),
        #temperature=0.7
    )

    return response.choices[0].message.content


def process_file(file_path, results):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    
        improved_content = improve_grammar(content)
    
        if improved_content.strip() != content.strip():
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(improved_content)
                print(f"File modified: {file_path}")
                results['modified_files'] += 1
        else:
            print(f"No changes made to file: {file_path}")
            
        results['processed_files'] += 1
    
    except Exception as e:
        print(f"Error processing file {file_path}: {e}")

def list_md_files(directory, max_workers):
    # Check if the directory exists
    if not os.path.isdir(directory):
        print(f"The directory {directory} does not exist.")
        return

    start_time = time.time()  # Start the timer
    
    files_to_process = []
    results = {'processed_files': 0, 'modified_files': 0}
    
    # Walk through all directories and files
    for root, dirs, files in os.walk(directory):
        for file in files:
            # Check if the file has a .md extension
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                files_to_process.append(file_path)
                
    # Process files in parallel
    with concurrent.futures.ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = [executor.submit(process_file, file_path, results) for file_path in files_to_process]
        concurrent.futures.wait(futures)
    
    end_time = time.time()  # End the timer
    total_time = end_time - start_time  # Calculate the total time
    
    # Determine how to print the total time
    if total_time < 60:
        time_str = "{:.2f} seconds".format(total_time)
    else:
        time_str = "{:.2f} minutes".format(total_time / 60)
        
    print("Total modified files: {} / {}".format(results['modified_files'], results['processed_files']))
    print("Total time: {}".format(time_str))
    
if __name__ == "__main__":
    # Check if the directory has been passed as an argument
    if len(sys.argv) < 2:
        print("Usage: python markdowngrammarfixer.py <baseDirectory> [<max_workers>]")
        sys.exit(1)

    directory = sys.argv[1]
    max_workers = int(sys.argv[2]) if len(sys.argv) > 2 else 4
    list_md_files(directory, max_workers)
