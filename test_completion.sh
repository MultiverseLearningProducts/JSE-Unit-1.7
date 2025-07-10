#!/bin/bash

# Development Environment Setup and Project Management Skills Application Test Script
# This script verifies completion of all required development environment and project management tasks

echo "=== Development Environment Setup and Project Management Skills Application Test ==="
echo "Testing completion of challenge tasks..."
echo

# Initialize test results
TASK1_PASSED=false
TASK2_PASSED=false
TASK3_PASSED=false
TASK4_PASSED=false
TASK5_PASSED=false

# Test Task 1: Java Development Environment Setup
echo "Testing Task 1: Java Development Environment Setup..."
TASK1_CHECKS=0
TASK1_TOTAL=10

# Check if dev-environment-setup directory exists
if [ -d "$HOME/dev-environment-setup" ]; then
    echo "✓ dev-environment-setup directory exists"
    ((TASK1_CHECKS++))
    
    # Change to the workspace directory
    cd "$HOME/dev-environment-setup"
    
    # Check for environment setup log
    if [ -f "environment-setup-log.txt" ] && [ -s "environment-setup-log.txt" ]; then
        echo "✓ Environment setup log documented"
        ((TASK1_CHECKS++))
    else
        echo "✗ Environment setup log not found or empty"
    fi
    
    # Check for Maven directory structure
    if [ -d "src/main/java" ] && [ -d "src/test/java" ] && [ -d "src/main/resources" ]; then
        echo "✓ Maven directory structure created"
        ((TASK1_CHECKS++))
    else
        echo "✗ Maven directory structure not found"
    fi
    
    # Check for package hierarchy
    if find src/main/java -type d -name "com" >/dev/null 2>&1 || 
       find src/main/java -type d -name "org" >/dev/null 2>&1; then
        echo "✓ Package hierarchy created"
        ((TASK1_CHECKS++))
    else
        echo "✗ Package hierarchy not found"
    fi
    
    # Check for Java files in proper structure
    if find src/main/java -name "*.java" | grep -q .; then
        echo "✓ Java files created in proper structure"
        ((TASK1_CHECKS++))
    else
        echo "✗ No Java files found in proper structure"
    fi
    
    # Check for basic project configuration files
    if [ -f "pom.xml" ] || [ -f "build.gradle" ] || [ -f "build.xml" ]; then
        echo "✓ Build configuration file exists"
        ((TASK1_CHECKS++))
    else
        echo "✗ Build configuration file not found"
    fi
    
    # Check if environment setup log contains relevant information
    if [ -f "environment-setup-log.txt" ] && 
       (grep -qi "java\|jdk\|maven\|gradle" "environment-setup-log.txt" 2>/dev/null); then
        echo "✓ Environment setup log contains relevant information"
        ((TASK1_CHECKS++))
    else
        echo "✗ Environment setup log lacks relevant information"
    fi
    
    # Check for system information in log
    if [ -f "environment-setup-log.txt" ] && 
       (grep -qi "version\|path\|home" "environment-setup-log.txt" 2>/dev/null); then
        echo "✓ System information documented"
        ((TASK1_CHECKS++))
    else
        echo "✗ System information not documented"
    fi
    
    # Check for target directory (build output)
    if [ -d "target" ] || [ -d "build" ] || [ -d "out" ]; then
        echo "✓ Build output directory exists"
        ((TASK1_CHECKS++))
    else
        echo "✓ Build output directory not required initially"
        ((TASK1_CHECKS++))
    fi
    
    # Check for README or similar documentation
    if [ -f "README.md" ] || [ -f "README.txt" ] || [ -f "project-info.txt" ]; then
        echo "✓ Project documentation exists"
        ((TASK1_CHECKS++))
    else
        echo "✗ Project documentation not found"
    fi
    
else
    echo "✗ dev-environment-setup directory not found"
fi

if [ $TASK1_CHECKS -eq $TASK1_TOTAL ]; then
    TASK1_PASSED=true
fi
echo

# Test Task 2: Project Configuration and Dependency Management
echo "Testing Task 2: Project Configuration and Dependency Management..."
TASK2_CHECKS=0
TASK2_TOTAL=12

if [ -d "$HOME/dev-environment-setup" ]; then
    cd "$HOME/dev-environment-setup"
    
    # Check for Maven pom.xml
    if [ -f "pom.xml" ] && [ -s "pom.xml" ]; then
        echo "✓ Maven pom.xml exists and has content"
        ((TASK2_CHECKS++))
    else
        echo "✗ Maven pom.xml not found or empty"
    fi
    
    # Check if pom.xml contains project information
    if [ -f "pom.xml" ] && 
       (grep -q "groupId\|artifactId\|version" "pom.xml" 2>/dev/null); then
        echo "✓ Project information configured in pom.xml"
        ((TASK2_CHECKS++))
    else
        echo "✗ Project information not configured in pom.xml"
    fi
    
    # Check for Java version configuration
    if [ -f "pom.xml" ] && 
       (grep -q "java.version\|maven.compiler" "pom.xml" 2>/dev/null); then
        echo "✓ Java version configuration found"
        ((TASK2_CHECKS++))
    else
        echo "✗ Java version configuration not found"
    fi
    
    # Check for dependencies (JUnit, logging)
    if [ -f "pom.xml" ] && 
       (grep -q "junit\|testing\|log4j\|slf4j\|logback" "pom.xml" 2>/dev/null); then
        echo "✓ Common dependencies configured"
        ((TASK2_CHECKS++))
    else
        echo "✗ Common dependencies not configured"
    fi
    
    # Check for main application class
    if find src/main/java -name "*.java" -exec grep -l "main.*String\[\]" {} \; | grep -q .; then
        echo "✓ Main application class exists"
        ((TASK2_CHECKS++))
    else
        echo "✗ Main application class not found"
    fi
    
    # Check for utility classes
    if find src/main/java -name "*.java" | grep -i "util\|helper\|service" | grep -q .; then
        echo "✓ Utility classes found"
        ((TASK2_CHECKS++))
    else
        echo "✗ Utility classes not found"
    fi
    
    # Check for test files
    if find src/test/java -name "*.java" | grep -q .; then
        echo "✓ Unit test files exist"
        ((TASK2_CHECKS++))
    else
        echo "✗ Unit test files not found"
    fi
    
    # Check for proper test naming conventions
    if find src/test/java -name "*Test.java" -o -name "*Tests.java" | grep -q .; then
        echo "✓ Test files follow naming conventions"
        ((TASK2_CHECKS++))
    else
        echo "✗ Test files don't follow naming conventions"
    fi
    
    # Check for dependency management guide
    if [ -f "dependency-management-guide.txt" ] && [ -s "dependency-management-guide.txt" ]; then
        echo "✓ Dependency management guide documented"
        ((TASK2_CHECKS++))
    else
        echo "✗ Dependency management guide not found or empty"
    fi
    
    # Check if guide contains relevant Maven information
    if [ -f "dependency-management-guide.txt" ] && 
       (grep -qi "maven\|lifecycle\|compile\|test\|package" "dependency-management-guide.txt" 2>/dev/null); then
        echo "✓ Guide contains relevant Maven information"
        ((TASK2_CHECKS++))
    else
        echo "✗ Guide lacks relevant Maven information"
    fi
    
    # Check for resources directory usage
    if [ -d "src/main/resources" ] && ls src/main/resources/ >/dev/null 2>&1; then
        echo "✓ Resources directory has content"
        ((TASK2_CHECKS++))
    else
        echo "✗ Resources directory empty or unused"
    fi
    
    # Check for project structure documentation
    if [ -f "dependency-management-guide.txt" ] && 
       (grep -qi "structure\|directory\|organization" "dependency-management-guide.txt" 2>/dev/null); then
        echo "✓ Project structure documented"
        ((TASK2_CHECKS++))
    else
        echo "✗ Project structure not documented"
    fi
    
else
    echo "✗ Cannot test Task 2 - workspace directory not found"
fi

if [ $TASK2_CHECKS -eq $TASK2_TOTAL ]; then
    TASK2_PASSED=true
fi
echo

# Test Task 3: Development Tools and IDE Configuration
echo "Testing Task 3: Development Tools and IDE Configuration..."
TASK3_CHECKS=0
TASK3_TOTAL=12

if [ -d "$HOME/dev-environment-setup" ]; then
    cd "$HOME/dev-environment-setup"
    
    # Check for .editorconfig
    if [ -f ".editorconfig" ] && [ -s ".editorconfig" ]; then
        echo "✓ .editorconfig file exists"
        ((TASK3_CHECKS++))
    else
        echo "✗ .editorconfig file not found or empty"
    fi
    
    # Check for development scripts
    if [ -f "build.sh" ] && [ -s "build.sh" ]; then
        echo "✓ build.sh script exists"
        ((TASK3_CHECKS++))
    else
        echo "✗ build.sh script not found or empty"
    fi
    
    # Check for test script
    if [ -f "test.sh" ] && [ -s "test.sh" ]; then
        echo "✓ test.sh script exists"
        ((TASK3_CHECKS++))
    else
        echo "✗ test.sh script not found or empty"
    fi
    
    # Check for clean script
    if [ -f "clean.sh" ] && [ -s "clean.sh" ]; then
        echo "✓ clean.sh script exists"
        ((TASK3_CHECKS++))
    else
        echo "✗ clean.sh script not found or empty"
    fi
    
    # Check if scripts are executable
    if [ -x "build.sh" ] && [ -x "test.sh" ] && [ -x "clean.sh" ]; then
        echo "✓ Development scripts are executable"
        ((TASK3_CHECKS++))
    else
        echo "✗ Development scripts are not executable"
    fi
    
    # Check for checkstyle configuration
    if [ -f "checkstyle.xml" ] || [ -f "checkstyle-config.xml" ] || grep -q "checkstyle" "pom.xml" 2>/dev/null; then
        echo "✓ Checkstyle configuration found"
        ((TASK3_CHECKS++))
    else
        echo "✗ Checkstyle configuration not found"
    fi
    
    # Check for PMD configuration
    if [ -f "pmd.xml" ] || [ -f "pmd-ruleset.xml" ] || grep -q "pmd" "pom.xml" 2>/dev/null; then
        echo "✓ PMD configuration found"
        ((TASK3_CHECKS++))
    else
        echo "✗ PMD configuration not found"
    fi
    
    # Check for Git hooks
    if [ -d ".git/hooks" ] && ls .git/hooks/ | grep -v "sample" | grep -q .; then
        echo "✓ Git hooks configured"
        ((TASK3_CHECKS++))
    else
        echo "✗ Git hooks not configured"
    fi
    
    # Check for development tools guide
    if [ -f "development-tools-guide.txt" ] && [ -s "development-tools-guide.txt" ]; then
        echo "✓ Development tools guide documented"
        ((TASK3_CHECKS++))
    else
        echo "✗ Development tools guide not found or empty"
    fi
    
    # Check if guide contains tool explanations
    if [ -f "development-tools-guide.txt" ] && 
       (grep -qi "checkstyle\|pmd\|editor\|ide" "development-tools-guide.txt" 2>/dev/null); then
        echo "✓ Guide contains tool explanations"
        ((TASK3_CHECKS++))
    else
        echo "✗ Guide lacks tool explanations"
    fi
    
    # Check for code style configuration
    if [ -f ".editorconfig" ] && 
       (grep -q "indent\|charset\|line_ending" ".editorconfig" 2>/dev/null); then
        echo "✓ Code style configuration found"
        ((TASK3_CHECKS++))
    else
        echo "✗ Code style configuration not found"
    fi
    
    # Check for coverage configuration
    if grep -q "jacoco\|coverage\|cobertura" "pom.xml" 2>/dev/null; then
        echo "✓ Test coverage configuration found"
        ((TASK3_CHECKS++))
    else
        echo "✗ Test coverage configuration not found"
    fi
    
else
    echo "✗ Cannot test Task 3 - workspace directory not found"
fi

if [ $TASK3_CHECKS -eq $TASK3_TOTAL ]; then
    TASK3_PASSED=true
fi
echo

# Test Task 4: Project Documentation and Standards
echo "Testing Task 4: Project Documentation and Standards..."
TASK4_CHECKS=0
TASK4_TOTAL=12

if [ -d "$HOME/dev-environment-setup" ]; then
    cd "$HOME/dev-environment-setup"
    
    # Check for comprehensive README.md
    if [ -f "README.md" ] && [ -s "README.md" ]; then
        echo "✓ README.md exists and has content"
        ((TASK4_CHECKS++))
    else
        echo "✗ README.md not found or empty"
    fi
    
    # Check for CONTRIBUTING.md
    if [ -f "CONTRIBUTING.md" ] && [ -s "CONTRIBUTING.md" ]; then
        echo "✓ CONTRIBUTING.md exists and has content"
        ((TASK4_CHECKS++))
    else
        echo "✗ CONTRIBUTING.md not found or empty"
    fi
    
    # Check for CHANGELOG.md
    if [ -f "CHANGELOG.md" ] && [ -s "CHANGELOG.md" ]; then
        echo "✓ CHANGELOG.md exists and has content"
        ((TASK4_CHECKS++))
    else
        echo "✗ CHANGELOG.md not found or empty"
    fi
    
    # Check for CODING_STANDARDS.md
    if [ -f "CODING_STANDARDS.md" ] && [ -s "CODING_STANDARDS.md" ]; then
        echo "✓ CODING_STANDARDS.md exists and has content"
        ((TASK4_CHECKS++))
    else
        echo "✗ CODING_STANDARDS.md not found or empty"
    fi
    
    # Check if coding standards contain Java best practices
    if [ -f "CODING_STANDARDS.md" ] && 
       (grep -qi "java\|naming\|convention\|method\|class" "CODING_STANDARDS.md" 2>/dev/null); then
        echo "✓ Coding standards contain Java best practices"
        ((TASK4_CHECKS++))
    else
        echo "✗ Coding standards lack Java best practices"
    fi
    
    # Check for Git workflow documentation
    if [ -f "CONTRIBUTING.md" ] && 
       (grep -qi "git\|branch\|commit\|pull request" "CONTRIBUTING.md" 2>/dev/null); then
        echo "✓ Git workflow documented"
        ((TASK4_CHECKS++))
    else
        echo "✗ Git workflow not documented"
    fi
    
    # Check for issue template
    if [ -f ".github/ISSUE_TEMPLATE.md" ] || [ -f "ISSUE_TEMPLATE.md" ] || 
       [ -d ".github/ISSUE_TEMPLATE" ]; then
        echo "✓ Issue template exists"
        ((TASK4_CHECKS++))
    else
        echo "✗ Issue template not found"
    fi
    
    # Check for pull request template
    if [ -f ".github/PULL_REQUEST_TEMPLATE.md" ] || [ -f "PULL_REQUEST_TEMPLATE.md" ]; then
        echo "✓ Pull request template exists"
        ((TASK4_CHECKS++))
    else
        echo "✗ Pull request template not found"
    fi
    
    # Check for project standards summary
    if [ -f "project-standards-summary.txt" ] && [ -s "project-standards-summary.txt" ]; then
        echo "✓ Project standards summary documented"
        ((TASK4_CHECKS++))
    else
        echo "✗ Project standards summary not found or empty"
    fi
    
    # Check if standards summary explains documentation importance
    if [ -f "project-standards-summary.txt" ] && 
       (grep -qi "documentation\|standard\|maintenance\|quality" "project-standards-summary.txt" 2>/dev/null); then
        echo "✓ Standards summary explains documentation importance"
        ((TASK4_CHECKS++))
    else
        echo "✗ Standards summary lacks documentation importance"
    fi
    
    # Check for code review guidelines
    if [ -f "CONTRIBUTING.md" ] && 
       (grep -qi "review\|checklist\|quality" "CONTRIBUTING.md" 2>/dev/null); then
        echo "✓ Code review guidelines documented"
        ((TASK4_CHECKS++))
    else
        echo "✗ Code review guidelines not documented"
    fi
    
    # Check for release process documentation
    if [ -f "CONTRIBUTING.md" ] && 
       (grep -qi "release\|version\|milestone" "CONTRIBUTING.md" 2>/dev/null); then
        echo "✓ Release process documented"
        ((TASK4_CHECKS++))
    else
        echo "✗ Release process not documented"
    fi
    
else
    echo "✗ Cannot test Task 4 - workspace directory not found"
fi

if [ $TASK4_CHECKS -eq $TASK4_TOTAL ]; then
    TASK4_PASSED=true
fi
echo

# Test Task 5: Testing and Quality Assurance Workflow
echo "Testing Task 5: Testing and Quality Assurance Workflow..."
TASK5_CHECKS=0
TASK5_TOTAL=15

if [ -d "$HOME/dev-environment-setup" ]; then
    cd "$HOME/dev-environment-setup"
    
    # Check for JUnit configuration
    if [ -f "pom.xml" ] && 
       (grep -q "junit" "pom.xml" 2>/dev/null); then
        echo "✓ JUnit testing framework configured"
        ((TASK5_CHECKS++))
    else
        echo "✗ JUnit testing framework not configured"
    fi
    
    # Check for integration test structure
    if [ -d "src/test/java" ] && 
       (find src/test/java -name "*IT.java" -o -name "*Integration*.java" | grep -q .); then
        echo "✓ Integration test structure exists"
        ((TASK5_CHECKS++))
    else
        echo "✗ Integration test structure not found"
    fi
    
    # Check for test data/resources
    if [ -d "src/test/resources" ] && ls src/test/resources/ >/dev/null 2>&1; then
        echo "✓ Test resources/data configured"
        ((TASK5_CHECKS++))
    else
        echo "✗ Test resources/data not configured"
    fi
    
    # Check for quality-check.sh script
    if [ -f "quality-check.sh" ] && [ -s "quality-check.sh" ]; then
        echo "✓ Quality check script exists"
        ((TASK5_CHECKS++))
    else
        echo "✗ Quality check script not found or empty"
    fi
    
    # Check if quality-check.sh is executable
    if [ -x "quality-check.sh" ]; then
        echo "✓ Quality check script is executable"
        ((TASK5_CHECKS++))
    else
        echo "✗ Quality check script is not executable"
    fi
    
    # Check for unit tests
    if find src/test/java -name "*Test.java" | grep -q .; then
        echo "✓ Unit tests exist"
        ((TASK5_CHECKS++))
    else
        echo "✗ Unit tests not found"
    fi
    
    # Check if unit tests contain actual test methods
    if find src/test/java -name "*Test.java" -exec grep -l "@Test\|@junit\|test.*(" {} \; | grep -q .; then
        echo "✓ Unit tests contain test methods"
        ((TASK5_CHECKS++))
    else
        echo "✗ Unit tests lack test methods"
    fi
    
    # Check for performance test examples
    if find src/test/java -name "*Performance*.java" -o -name "*Load*.java" | grep -q .; then
        echo "✓ Performance test examples exist"
        ((TASK5_CHECKS++))
    else
        echo "✗ Performance test examples not found"
    fi
    
    # Check for testing workflow guide
    if [ -f "testing-workflow-guide.txt" ] && [ -s "testing-workflow-guide.txt" ]; then
        echo "✓ Testing workflow guide documented"
        ((TASK5_CHECKS++))
    else
        echo "✗ Testing workflow guide not found or empty"
    fi
    
    # Check if testing guide explains different test types
    if [ -f "testing-workflow-guide.txt" ] && 
       (grep -qi "unit\|integration\|performance\|acceptance" "testing-workflow-guide.txt" 2>/dev/null); then
        echo "✓ Testing guide explains different test types"
        ((TASK5_CHECKS++))
    else
        echo "✗ Testing guide lacks test type explanations"
    fi
    
    # Check for project health check script
    if [ -f "project-health-check.sh" ] && [ -s "project-health-check.sh" ]; then
        echo "✓ Project health check script exists"
        ((TASK5_CHECKS++))
    else
        echo "✗ Project health check script not found or empty"
    fi
    
    # Check if health check script is executable
    if [ -x "project-health-check.sh" ]; then
        echo "✓ Project health check script is executable"
        ((TASK5_CHECKS++))
    else
        echo "✗ Project health check script is not executable"
    fi
    
    # Check for quality gates documentation
    if [ -f "testing-workflow-guide.txt" ] && 
       (grep -qi "quality.*gate\|acceptance.*criteria\|coverage" "testing-workflow-guide.txt" 2>/dev/null); then
        echo "✓ Quality gates documented"
        ((TASK5_CHECKS++))
    else
        echo "✗ Quality gates not documented"
    fi
    
    # Check for CI simulation
    if [ -f "quality-check.sh" ] && 
       (grep -qi "mvn\|maven\|test\|compile\|verify" "quality-check.sh" 2>/dev/null); then
        echo "✓ CI simulation implemented"
        ((TASK5_CHECKS++))
    else
        echo "✗ CI simulation not implemented"
    fi
    
    # Check for project health indicators
    if [ -f "project-health-check.sh" ] && 
       (grep -qi "coverage\|test\|build\|metric" "project-health-check.sh" 2>/dev/null); then
        echo "✓ Project health indicators documented"
        ((TASK5_CHECKS++))
    else
        echo "✗ Project health indicators not documented"
    fi
    
else
    echo "✗ Cannot test Task 5 - workspace directory not found"
fi

if [ $TASK5_CHECKS -eq $TASK5_TOTAL ]; then
    TASK5_PASSED=true
fi
echo

# Final Results
echo "=== TEST RESULTS ==="
echo "Task 1 (Java Development Environment Setup): $TASK1_PASSED ($TASK1_CHECKS/$TASK1_TOTAL checks passed)"
echo "Task 2 (Project Configuration and Dependency Management): $TASK2_PASSED ($TASK2_CHECKS/$TASK2_TOTAL checks passed)"
echo "Task 3 (Development Tools and IDE Configuration): $TASK3_PASSED ($TASK3_CHECKS/$TASK3_TOTAL checks passed)"
echo "Task 4 (Project Documentation and Standards): $TASK4_PASSED ($TASK4_CHECKS/$TASK4_TOTAL checks passed)"
echo "Task 5 (Testing and Quality Assurance Workflow): $TASK5_PASSED ($TASK5_CHECKS/$TASK5_TOTAL checks passed)"
echo

# Overall result
if [ "$TASK1_PASSED" = true ] && [ "$TASK2_PASSED" = true ] && [ "$TASK3_PASSED" = true ] && [ "$TASK4_PASSED" = true ] && [ "$TASK5_PASSED" = true ]; then
    echo "OVERALL RESULT: true"
    echo "All development environment and project management tasks completed successfully!"
    exit 0
else
    echo "OVERALL RESULT: false"
    echo "Some development environment and project management tasks are incomplete. Please review the requirements."
    exit 1
fi 