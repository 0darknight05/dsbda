
# 📊 DSBDAL Setup Guide
**Author:** biggiecheese
**Environment:** Fedora / x86_64
**Toolchain:** uv (Python 3.14 Home / 3.12 Lab)

---

## CLONE REPO

```bash
git clone -b dsbda --single-branch https://github.com/0Shree005/labs.git
```

## ⚡ 1. Preparation (Permissions)
If copying from a Pendrive, Linux will often strip execution bits. Fix this first:
```bash
chmod +x ./uv
```

## 📦 2. Environment Setup (Offline)
Create the venv and install all libraries using the pre-downloaded `.whl` files in the `vendor` folder. This skips the internet entirely.
```bash
# Initialize venv
./uv venv

# Lightning install from local cache
./uv pip install --no-index --find-links vendor -r loose_reqs.txt
```

## 🛠️ 3. Jupyter Kernel Registration
**CRITICAL:** Without this, Jupyter will use the system Python and won't see your libraries.
```bash
./uv run python -m ipykernel install --user --name dsbda --display-name "DSBDA-Venv"
```

## 🚀 4. Launching the Lab
Start Jupyter. Once open, click **Kernel > Change Kernel > DSBDA-Venv**.
```bash
./uv run jupyter notebook
```

---

## 🔍 Troubleshooting (Monday Dry-Run)

### ❓ "ModuleNotFoundError: seaborn"
- **Reason:** Jupyter is likely using the "Global" kernel.
- **Fix:** In the top-right corner of the notebook UI, switch the kernel to **DSBDA-Venv**.
- **Verify:** Run `import sys; print(sys.executable)` in a cell. It should point to your folder's `.venv`.

### ❓ "ValueError: Input X contains NaN"
- **Reason:** Scikit-Learn's `LinearRegression` cannot handle missing values.
- **Fix:** Add `df = df.fillna(df.mean())` or `df = df.dropna()` before fitting the model.

### ❓ "Permission Denied" on USB
- **Reason:** Some college labs mount USBs with `noexec` flags.
- **Fix:** Copy the entire `dsbda` folder to the local **Desktop** or **Documents** folder first, then run `chmod +x ./uv`.

### ❓ "Java/MapReduce Programs"
- **Note:** Practical 11, 12, and 13 (Hadoop) are stored as `.java` files.
- **Run:** Copy the source code and paste it into the [Programiz Online Compiler](https://www.programiz.com/java-programming/online-compiler/).

---

## 📂 Practical Map
- **Pr 1-2:** Data Wrangling (Pandas/NumPy)
- **Pr 3:** Descriptive Stats (Mean/Median/Std)
- **Pr 4-5:** Regression & Classification (Scikit-learn)
- **Pr 6:** Naive Bayes
- **Pr 7:** Text Analytics (NLTK)
- **Pr 8-10:** Visualization (Matplotlib/Seaborn)

---
