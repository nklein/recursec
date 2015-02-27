(in-package #:recursec-tests)

(nst:def-fixtures recursec-package ()
  (pkg (find-package '#:RECURSEC)))

(nst:def-test-group recursec-exports (recursec-package)
  (nst:def-test package-exists (:true)
    pkg))
